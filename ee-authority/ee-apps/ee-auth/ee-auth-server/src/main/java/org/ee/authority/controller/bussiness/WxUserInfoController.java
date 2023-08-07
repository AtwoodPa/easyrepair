package org.ee.authority.controller.bussiness;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FileUtils;

import org.apache.commons.lang3.StringUtils;
import org.ee.authority.entity.bussiness.WxUserInfo;
import org.ee.authority.properties.WeixinProperties;
import org.ee.authority.service.bussiness.WxUserInfoService;
import org.ee.authority.utils.HttpClientUtil;
import org.ee.authority.utils.JwtHelper;
import org.ee.authority.utils.wxjwt.JwtConstant;
import org.ee.authority.utils.wxjwt.JwtUtils;
import org.ee.authority.utils.wxjwt.R;
import org.ee.base.Result;
import org.ee.exception.AtwoodException;
import org.ee.exception.code.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/8/3 09:53
 */
@Api(value = "微信接口 ", tags = "微信接口")
@RestController
@RequestMapping("/user")
public class WxUserInfoController {
    @Autowired
    private WxUserInfoService wxUserInfoService;

    @Autowired
    private WeixinProperties weixinProperties;

    @Autowired
    private HttpClientUtil httpClientUtil;

    @Value("${server.ip}")
    private String serverIp;
    @Value("${server.port}")
    private String serverPort;
    @Value("${files.uploads.path}")
    private String fileUploadPath;

    /**
     * 获取所有wx用户的信息
     *
     * @return
     */
    @ApiOperation(value = "微信接口 - 获取所有wx用户的信息")
    @GetMapping("/allWxUserInfo")
    public Result getAllWxUserInfo() {
        List<WxUserInfo> list = wxUserInfoService.list();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("wxUserInfoList", list);

        return Result.ok(resultMap);
    }

    /**
     * 微信用户登录
     *
     * @param wxUserInfo
     * @return
     */
    @ApiOperation(value = "微信用户登录")
    @PostMapping("/wxLogin")
    public R wxLogin(@RequestBody WxUserInfo wxUserInfo) {
        String jscode2sessionUrl = weixinProperties.getJscode2sessionUrl() + "?appid=" + weixinProperties.getAppid() + "&secret=" + weixinProperties.getSecret() + "&js_code=" + wxUserInfo.getCode() + "&grant_type=authorization_code";
        System.out.println(jscode2sessionUrl);
        String result = httpClientUtil.sendHttpGet(jscode2sessionUrl);
        System.out.println("result = " + result);
        JSONObject jsonObject = JSON.parseObject(result);
        String openid = jsonObject.get("openid").toString();
        System.out.println("openid = " + openid);
        // 插入用户到数据库 假如用户不存在，添加用户；存在的话，更新用户信息
        WxUserInfo resultWxUserInfo = wxUserInfoService.getOne(new QueryWrapper<WxUserInfo>().eq("openid", openid));
        if (resultWxUserInfo == null) {
            // 不存在
            System.out.println("不存在 插入用户");
            // wx用户登录的时候，同步存储到SysUser表中
//            SysUser sysUser = new SysUser();
            wxUserInfo.setOpenid(openid);
            wxUserInfo.setRegisterDate(new Date());
            wxUserInfo.setLastLoginDate(new Date());
            wxUserInfoService.save(wxUserInfo);
        } else {
            // 存在
            // wx用户登录的时候，同步存储到SysUser表中
            System.out.println("存在 更新用户");
            resultWxUserInfo.setLastLoginDate(new Date());
            wxUserInfoService.updateById(resultWxUserInfo);
        }
        if (resultWxUserInfo != null && resultWxUserInfo.getStatus().equals("1")) {
            // 被 禁用
            return R.error(400, "用户被禁用，具体请联系管理员！");
        } else {
            // 用户状态正常，生成token返回到前端
            String token = JwtUtils.createJWT(resultWxUserInfo.getOpenid(), resultWxUserInfo.getNickName(), JwtConstant.JWT_TTL);
            Claims claims = JwtUtils.parseJWT(token);
            System.out.println("=================wxLogin  claims = " + claims.getSubject());
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("token", token);
            resultMap.put("openid", openid);

            return R.ok(resultMap);
        }
    }

    @ApiOperation(value = "微信用户查询自己的信息")
    @GetMapping("/getUserInfo")
    public R getUserInfo(@RequestHeader String token) {
        System.out.println("token = " + token);
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        System.out.println("claims.getId() = " + claims.getId());
        WxUserInfo currentUser =
                wxUserInfoService.getOne(
                        new QueryWrapper<WxUserInfo>()
                                .eq("openid", claims.getId()));

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("currentUser", currentUser);

        return R.ok(resultMap);
    }

    /**
     * 更新用户昵称
     *
     * @param wxUserInfo
     * @param token
     * @return
     */
    @ApiOperation(value = "更新用户昵称")
    @RequestMapping("/updateNickName")
    public R updateNickName(@RequestBody WxUserInfo wxUserInfo, @RequestHeader String token) {
        if (StringUtils.isNotEmpty(wxUserInfo.getNickName())) {
            Claims claims = JwtUtils.validateJWT(token).getClaims();
            boolean update = wxUserInfoService.update(new UpdateWrapper<WxUserInfo>().eq("openid", claims.getId()).set("nick_name", wxUserInfo.getNickName()));
            if (update) {
                return R.ok();
            }
        }
        return R.ok();
    }


    /**
     * 上传用户头像图片
     *
     * @param userImage
     * @param token
     * @return
     */
    @RequestMapping("/updateUserImage")
    public String updateUserImage(MultipartFile userImage, @RequestHeader String token) throws Exception {
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        // 获取文件类型
        String contentType = userImage.getContentType();
        Map<String,Object> map = new HashMap<String,Object>();
        String url ="";
        // 支持上传的图片格式
        List<String> listType = new ArrayList<>();
        listType.add("image/png");listType.add("image/jpg");
        listType.add("image/jpeg");listType.add("image/gif");
        listType.add("image/bmp");listType.add("image/svg+xml");
        // 判断文件类型是否在允许上传的类型列表内
        if (!listType.contains(contentType)) {
            System.out.println("该类型不允许上传");
            throw new AtwoodException(ResultCodeEnum.NODE_ERROR,"该类型不允许上传");
        }
        // 文件上传操作
        if (!userImage.isEmpty()) {
            // 获取输入流
            InputStream is = userImage.getInputStream();
            // 生成UUID文件名
            String uuid = UUID.randomUUID().toString();
            // 获取上传文件的扩展名
            String suffixName = userImage.getOriginalFilename().substring(userImage.getOriginalFilename().lastIndexOf("."));
            // 生成文件完整名称
            String fileName = uuid + suffixName;
            // 获取完整路径
            String  absolutePath = fileUploadPath + fileName;
            // 生成文件夹，文件上传路径/data/projects/images/
            File folder = new File(fileUploadPath);
            if (!folder.exists()) {folder.mkdirs();}
            int len = 0;
            // 文件输出流
            FileOutputStream fos = new FileOutputStream(absolutePath);
            while ((len = is.read()) != -1) {
                // 流写入到文件
                fos.write(len);
            }
            //关闭流
            fos.close();
            is.close();
            // 将字节从InputStream源复制到文件目标
//            url = "http://" + serverIp +":" + serverPort + "/views?fileName=" + fileName;
            // 服务器地址
            url = "https://" + serverIp +":" + serverPort + "/views?fileName=" + fileName;
            map.put("url","https://" + serverIp +":" + serverPort + "/views?fileName=" + fileName);
            map.put("alt",userImage.getOriginalFilename());
            map.put("userImageFileName", url);
            map.put("code", 0);
            map.put("msg", "上传成功");

            // 更新到数据库
            UpdateWrapper<WxUserInfo> updateWrapper = new UpdateWrapper<>();
            System.out.println("上传用户头像图片");
            System.out.println("claims.getId() = " + claims.getId());
            System.out.println("avatar_url = " + url);
            updateWrapper
                    .eq("openid", claims.getId())
                    // 设置到数据库avatar_url
                    .set("avatar_url", url);
            System.out.println("updateWrapper = " + updateWrapper);
            wxUserInfoService.update(updateWrapper);
        }
        // 返回url，用于小程序回显头像
        return url;
    }


}
