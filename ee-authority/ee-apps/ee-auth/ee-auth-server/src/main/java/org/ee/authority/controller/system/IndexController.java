package org.ee.authority.controller.system;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.ee.authority.entity.system.SysUser;
import org.ee.authority.service.system.SysUserService;
import org.ee.authority.utils.JwtHelper;
import org.ee.authority.utils.MD5;
import org.ee.authority.vo.LoginVo;
import org.ee.base.Result;
import org.ee.exception.AtwoodException;
import org.ee.exception.code.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Api(value = "登录接口",tags = "登录接口")
@RestController
@RequestMapping("/admin/system/index")
public class IndexController {

    @Autowired
    SysUserService sysUserService;

    /**
     * 登录
     * @return
     */
    @ApiOperation(value = "登录")
    @PostMapping("/login")
    public Result login(@RequestBody LoginVo loginVo) {
        String username = loginVo.getUsername();
        String password = loginVo.getPassword();
        // 将密码进行加密操作
        String md5Encode = MD5.MD5Encode(password,"UTF-8");
        // 根据username查询用户
        SysUser sysUser = sysUserService.getUserInfoByUserName(username);
        System.out.println("================================");
        System.out.println("sysUser = " + sysUser);
        System.out.println("sysUserIDIDID = " + sysUser.getId());

        // 如果查询返回的用户为空，说明用户名或密码错误
        if (sysUser == null){
            throw new AtwoodException(ResultCodeEnum.ACCOUNT_ERROR,"账号或密码错误");
        }
        // 将查询出来的用户密码进行比对
        if (!sysUser.getPassword().equals(md5Encode)){
            throw new AtwoodException(ResultCodeEnum.ACCOUNT_ERROR,"账号或密码错误");
        }
        // 查询用户是否停用
        if (sysUser.getStatus().intValue() == 0){
            throw new AtwoodException(ResultCodeEnum.ACCOUNT_STOP,"账号已被停用");
        }

        // 根据用户id和username生成token
        String token = JwtHelper.createToken(sysUser.getId(), sysUser.getUsername());

        Map<String, Object> map = new HashMap<>();


        map.put("token",token);
        return Result.ok(map);
    }
    /**
     * 获取用户信息
     * @return
     */
    @ApiOperation(value = "获取用户信息")
    @GetMapping("/info")
    public Result info(HttpServletRequest request) {
        // 1、获取请求头里面的token
        String token = request.getHeader("token");
        System.out.println("token = " + token);
        // 2、从token字符串中获取用户名称
        String username = JwtHelper.getUsername(token);
        System.out.println("username = " + username);
        // 3、根据username获取用户信息
        Map<String, Object> map  = sysUserService.getUserInfo(username);

        return Result.ok(map);
    }
    /**
     * 退出
     * @return
     */
    @ApiOperation(value = "退出")
    @PostMapping("/logout")
    public Result logout(){
        return Result.ok();
    }

}