package org.ee.authority.controller.common;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.io.FileUtils;

import org.ee.base.Result;
import org.ee.exception.AtwoodException;
import org.ee.exception.code.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 文件上传接口
 * @author ss_419
 */
@Api(value = "文件上传接口",tags = "文件上传接口")
@RestController
public class UploadController {
    @Value("${server.ip}")
     private String serverIp;
    @Value("${server.port}")
    private String serverPort;
    @Value("${files.uploads.path}")
    private String fileUploadPath;
    SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");

    /**
     * TODO 上传图片
     * 1、文件上传
     * @param file
     * @return
     * @throws IOException
     */
    @ApiOperation(value = "图片文件上传vue")
    @PostMapping("/file/upload")
    public Result uploadFile(@RequestParam MultipartFile file) throws IOException {
        // 获取文件类型
        String contentType = file.getContentType();
        // 图片格式
        List<String> listType = new ArrayList<>();
        listType.add("image/png");listType.add("image/jpg");listType.add("image/jpeg");listType.add("image/gif");listType.add("image/bmp");listType.add("image/svg+xml");
        // 判断文件类型是否在允许上传的类型列表内
        if (!listType.contains(contentType)) {
            System.out.println("该类型不允许上传");
            throw new AtwoodException(ResultCodeEnum.NODE_ERROR,"该类型不允许上传");
        }
        InputStream inputStream = file.getInputStream();
        // 生成UUID文件名
        String uuid = UUID.randomUUID().toString();
        // 获取上传文件的扩展名
        String fix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        // 生成文件完整名称
        String fileName = uuid + fix;
        // 获取完成路径
        String absolutePath = fileUploadPath + fileName;
        // 生成文件夹
        File folder = new File(fileUploadPath);
        if (!folder.exists()) {folder.mkdirs();}
        int len = 0;
        FileOutputStream fileOutputStream = new FileOutputStream(absolutePath);
        while ((len = inputStream.read()) != -1) {
            fileOutputStream.write(len);
        }
        fileOutputStream.close();
        inputStream.close();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("url","http://" + serverIp +":" + serverPort + "/views?fileName=" + fileName);
        map.put("alt",file.getOriginalFilename());
        return Result.ok(map);
    }
    @ApiOperation(value = "图片文件上传wx")
    @PostMapping("/file/uploadWx")
    public String uploadFileWx(@RequestParam MultipartFile file) throws IOException {
        // 获取文件类型
        String contentType = file.getContentType();
        // 图片格式
        List<String> listType = new ArrayList<>();
        listType.add("image/png");listType.add("image/jpg");
        listType.add("image/jpeg");listType.add("image/gif");
        listType.add("image/bmp");listType.add("image/svg+xml");
        // 判断文件类型是否在允许上传的类型列表内
        if (!listType.contains(contentType)) {
            System.out.println("该类型不允许上传");
            throw new AtwoodException(ResultCodeEnum.NODE_ERROR,"该类型不允许上传");
        }
        InputStream inputStream = file.getInputStream();
        // 生成UUID文件名
        String uuid = UUID.randomUUID().toString();
        // 获取上传文件的扩展名
        String fix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        // 生成文件完整名称
        String fileName = uuid + fix;
        // 获取完成路径
        String absolutePath = fileUploadPath + fileName;
        // 生成文件夹
        File folder = new File(fileUploadPath);
        if (!folder.exists()) {folder.mkdirs();}
        int len = 0;
        FileOutputStream fileOutputStream = new FileOutputStream(absolutePath);
        while ((len = inputStream.read()) != -1) {
            fileOutputStream.write(len);
        }
        fileOutputStream.close();
        inputStream.close();
        Map<String,Object> map = new HashMap<String,Object>();
        String url = "http://" + serverIp +":" + serverPort + "/views?fileName=" + fileName;
        map.put("url","http://" + serverIp +":" + serverPort + "/views?fileName=" + fileName);
        map.put("alt",file.getOriginalFilename());
        // 返回url地址
        return url;
    }

    /**
     * TODO 预览图片
     * 2、获取二进制数据流图片
     */
    @ApiOperation(value = "预览图片-二进制数据流")
    @GetMapping("/views")
    public void views(@RequestParam String fileName, HttpServletResponse response) throws IOException {
        String[] split = fileName.split("/");
        String name = split[split.length - 1];
        File file = new File(fileUploadPath + name);
        // 设置输出流格式
        ServletOutputStream outputStream = response.getOutputStream();
        response.addHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(name,"UTF-8"));

        // 任意类型的二进制流数据
        response.setContentType("application/octet-stream");

        // 读取文件字节流
        outputStream.write(FileUtils.readFileToByteArray(file));
        outputStream.flush();
        outputStream.close();

    }

    /**
     * 存储为二进制图片数据流
     * @param file
     * @param req
     * @return
     */
    @ApiOperation(value = "存储为二进制图片数据流")
    @PostMapping("/upload")
    public Map<String, Object> fileupload(MultipartFile file, HttpServletRequest req) {
        Map<String, Object> result = new HashMap<>();
        String format = sdf.format(new Date());
        String realPath = req.getServletContext().getRealPath("/") + format;
        File folder = new File(realPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        String oldName = file.getOriginalFilename();
        String newName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."));
        try {
            file.transferTo(new File(folder, newName));
            String url = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + format + newName;
            result.put("status", "OK");
            result.put("name", oldName);
            result.put("url", url);
        } catch (IOException e) {
            result.put("status", "ERROR");
            result.put("msg", e.getMessage());
        }
        return result;
    }

}


