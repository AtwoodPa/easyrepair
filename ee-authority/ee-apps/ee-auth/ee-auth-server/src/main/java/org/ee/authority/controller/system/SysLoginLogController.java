package org.ee.authority.controller.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.ee.authority.entity.system.SysLoginLog;
import org.ee.authority.service.logs.AsyncLoginLogService;
import org.ee.authority.vo.SysLoginLogQueryVo;
import org.ee.base.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/10 08:32
 */
@Api(value = "登录日志管理",tags = "登录日志管理")
@RestController
@RequestMapping("/admin/system/sysLoginLog")
@SuppressWarnings({"unchecked", "rawtypes"})
public class SysLoginLogController {
    
    @Autowired
    AsyncLoginLogService asyncLoginLogService;


    @ApiOperation(value = "获取分页列表")
    @GetMapping("{page}/{limit}")
    public Result index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "sysLoginLogVo", value = "查询对象", required = false)
            SysLoginLogQueryVo sysLoginLogQueryVo) {
        Page<SysLoginLog> pageParam = new Page<>(page, limit);
        IPage<SysLoginLog> pageModel = asyncLoginLogService.selectPage(pageParam, sysLoginLogQueryVo);
        return Result.ok(pageModel);
    }

    @ApiOperation(value = "获取")
    @GetMapping("get/{id}")
    public Result get(@PathVariable String id) {

        SysLoginLog sysLoginLog = asyncLoginLogService.getById(id);
        return Result.ok(sysLoginLog);
    }
}
