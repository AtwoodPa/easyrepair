package org.ee.authority.controller.bussiness;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;

import org.ee.authority.entity.bussiness.Report;
import org.ee.authority.entity.bussiness.WxUserInfo;
import org.ee.authority.service.bussiness.ReportService;
import org.ee.authority.utils.wxjwt.JwtUtils;
import org.ee.authority.utils.wxjwt.R;
import org.ee.authority.vo.ReportQueryVo;
import org.ee.base.Result;
import org.ee.exception.AtwoodException;
import org.ee.exception.code.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.*;

/**
 * <p>
 * 设备报修api
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-10
 */
@Api(tags = "设备报修")
@RestController
@RequestMapping("/api/v1/report")
public class TReportController {
    @Autowired
    private ReportService reportService;
    @Value("${server.ip}")
    private String serverIp;
    @Value("${server.port}")
    private String serverPort;
    @Value("${files.uploads.path}")
    private String fileUploadPath;

    @ApiOperation(value = "获取全部用户列表")
    @GetMapping("findAll")
    public Result<List<Report>> findAll() {
        List<Report> userList = reportService.list();

        return Result.ok(userList);
    }

    //    @ApiOperation(value = "获取分页列表")
    @GetMapping("/{page}/{limit}")
    public Result findPage(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "roleQueryVo", value = "查询对象", required = false)
            ReportQueryVo roleQueryVo
    ) {

        Page<Report> pageParam = new Page<>(page, limit);
        IPage<Report> pageResult = reportService.selectPage(pageParam, roleQueryVo);
        return Result.ok(pageResult);
    }

    @ApiOperation(value = "根据id获取用户")
    @GetMapping("/get/{id}")
    public Result get(@PathVariable String id) {
        Report report = reportService.getById(id);
        return Result.ok(report);
    }

    @ApiOperation(value = "保存报修记录")
    @PostMapping("/save")
    public Result save(@RequestBody Report report) {

        boolean save = reportService.save(report);
        if (save) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "更新用户")
    @PutMapping("/update")
    public Result update(@RequestBody Report report) {

        boolean update = reportService.updateById(report);
        if (update) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "删除用户")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable String id) {
        boolean delete = reportService.removeById(id);
        if (delete) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "批量删除用户")
    @DeleteMapping("/batchRemove")
    public Result batchRemove(@RequestBody List<Long> idList) {
        boolean remove = reportService.removeByIds(idList);
        if (remove) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "更新状态")
    @GetMapping("updateStatus/{id}/{status}")
    public Result updateStatus(
            @PathVariable("id") Long id,
            @PathVariable("status") Integer status
    ) {
        boolean update = reportService.updateStatus(id, status);
        if (update) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "根据tabs动态查询数据")
    @RequestMapping("/list")
    public Result list(
            Integer type, Integer page, Integer pageSize, String nickName
    ) {
        System.out.println("type = " + type);
        List<Report> reportList = null;
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Page<Report> pageReport = new Page<>(page, pageSize);
        // 状态（0：停用，1:新报修，2:维修中，3:已完成）
        if (type == 0) {
            // 全部记录
//            Page<Report> reportResult = reportService.page(pageReport, new QueryWrapper<Report>().orderByDesc("id"));
            IPage<Report> reportResult = reportService.selectPage2(pageReport, type, nickName);
            System.out.println("总记录数" + reportResult.getTotal());
            System.out.println("总页数" + reportResult.getPages());
            System.out.println("当前页数据" + reportResult.getRecords());
            reportList = reportResult.getRecords();
            resultMap.put("total", reportResult.getTotal());
            resultMap.put("totalPage", reportResult.getPages());
        } else {
            // 根据type进行查询
//            Page<Report> reportResult = reportService.page(pageReport, new QueryWrapper<Report>().eq("status", type).orderByDesc("id"));
            IPage<Report> reportResult = reportService.selectPage2(pageReport, type, nickName);
            System.out.println("总记录数" + reportResult.getTotal());
            System.out.println("总页数" + reportResult.getPages());
            System.out.println("当前页数据" + reportResult.getRecords());
            reportList = reportResult.getRecords();
            resultMap.put("total", reportResult.getTotal());
            resultMap.put("totalPage", reportResult.getPages());
        }
        resultMap.put("reportList", reportList);
        resultMap.put("message", "状态 ( 0：全部记录，1:新报修，2:维修中，3:已完成 )");
        return Result.ok(resultMap);
    }

    @GetMapping("/search")
    public Result search(String q) {
        List<Report> results = reportService.list(new QueryWrapper<Report>().like("username", q));
        Map<String, Object> map = new HashMap<>();
        map.put("message", results);
        return Result.ok(map);
    }

    @RequestMapping("/getAllReports")
    public R getAllReports(@RequestHeader String token) {
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        String openid = claims.getId();
        List<Report> list = reportService.list(new QueryWrapper<Report>().eq("openid",openid).orderByDesc("id"));
        return R.ok().put("allReports", list);
    }


    /**
     * 提交报修表单
     * @param report
     * @param token
     * @return
     */
    @ApiOperation(value = "新增报修单")
    @RequestMapping  ("/addReport")
    public R addReport(@RequestBody Report report,@RequestHeader String token){
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        // 创建者openid
        String openid = claims.getId();
        report.setOpenid(openid);
        System.out.println("report.getTelephone() = " + report);

        boolean save = reportService.save(report);

        Map<String,Object> map = new HashMap<>();
        if(save){
            map.put("code",200);
        }

        return R.ok(map);
    }

    @PostMapping("/edit")
    public R edit(@RequestBody Report report){
        report.setUpdateTime(new Date());
        reportService.updateById(report);
        return R.ok();
    }
    @RequestMapping("/getReportsByStatus/{status}")
    public R getReportsByStatus(@PathVariable(value = "status") Integer status,@RequestHeader String token){
        // 0 - 全部、 1 - 新报修、 2 - 维修中、 3 - 已完成
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        String openid = claims.getId();
        if (status == 0){
            // 全部记录
            List<Report> list = reportService.list(new QueryWrapper<Report>().eq("openid",openid).orderByDesc("id"));

            return R.ok().put("allReports", list);
        }else {
            // 新报修、维修中、已完成
            List<Report> list = reportService.list(new QueryWrapper<Report>().eq("status", status).eq("openid",openid).orderByDesc("id"));

            return R.ok().put("allReports", list);
        }
    }

    /**
     * 我的报修记录管理-根据id删除报修记录
     * @param id
     * @param token
     * @return
     */
    @GetMapping("/remove/{id}")
    public R delete(@PathVariable(value = "id") Integer id,@RequestHeader String token){
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        String openid = claims.getId();
        reportService.remove(new QueryWrapper<Report>().eq("id",id).eq("openid",openid));
        return R.ok();
    }
    /**
     * 根据时间范围查询报修记录

     * @return
     */
    @RequestMapping("/getReportByTimeArrays/{startTime}/{endTime}")
    public R getReportByTimeArrays(@PathVariable String startTime, @PathVariable String endTime){
        List<Report> list = reportService.list(new QueryWrapper<Report>().between("create_time", startTime, endTime));
        Map<String,Object> map = new HashMap<>();
        map.put("allReports",list);
        return R.ok(map);
    }

    @GetMapping("/{id}")
    public R findById(@PathVariable("id") Integer id){
        Report report = reportService.getById(id);
        return R.ok().put("report", report);
    }

    @RequestMapping("/uploadReportImage")
    public Map<String,Object> updateUserImage(MultipartFile reportImage, @RequestHeader String token) throws Exception {
        Claims claims = JwtUtils.validateJWT(token).getClaims();


        // 获取文件类型
        String contentType = reportImage.getContentType();
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
        if (!reportImage.isEmpty()) {
            // 获取输入流
            InputStream is = reportImage.getInputStream();
            // 生成UUID文件名
            String uuid = UUID.randomUUID().toString();
            // 获取上传文件的扩展名
            String suffixName = reportImage.getOriginalFilename().substring(reportImage.getOriginalFilename().lastIndexOf("."));
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
            // 服务器地址
            // url = "http://" + serverIp +":" + serverPort + "/views?fileName=" + fileName;
            url = "https://" + serverIp +":" + serverPort + "/views?fileName=" + fileName;
            map.put("url","https://" + serverIp +":" + serverPort + "/views?fileName=" + fileName);
            map.put("alt",reportImage.getOriginalFilename());
            map.put("reportImageFileName", url);
            map.put("code", 200);
            map.put("msg", "上传成功");
        }

        return map;
    }
}
