package org.ee.authority.controller.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.ee.authority.entity.system.SysOperLog;
import org.ee.authority.service.logs.AsyncOperLogService;
import org.ee.authority.vo.SysOperLogQueryVo;
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
 * @date 2023/5/10 08:46
 */
@Api(value = "操作日志管理", tags = "操作日志管理")
@RestController
@RequestMapping(value="/admin/system/sysOperLog")
@SuppressWarnings({"unchecked", "rawtypes"})
public class SysOperLogController {

    @Autowired
    AsyncOperLogService asyncOperLogService;

    @ApiOperation(value = "获取分页列表")
    @GetMapping("{page}/{limit}")
    public Result index(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "sysOperLogVo", value = "查询对象", required = false)
            SysOperLogQueryVo sysOperLogQueryVo) {
        Page<SysOperLog> pageParam = new Page<>(page, limit);
        IPage<SysOperLog> pageModel = asyncOperLogService.selectPage(pageParam, sysOperLogQueryVo);
        return Result.ok(pageModel);
    }

    @ApiOperation(value = "获取")
    @GetMapping("get/{id}")
    public Result get(@PathVariable String id) {
        SysOperLog sysOperLog = asyncOperLogService.getById(id);
        return Result.ok(sysOperLog);
    }
}
