package org.ee.authority.controller.system;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.ee.authority.entity.system.SysUser;
import org.ee.authority.service.system.SysUserService;
import org.ee.authority.utils.MD5;
import org.ee.authority.vo.SysUserQueryVo;
import org.ee.base.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-07
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/admin/system/sysUser")
public class SysUserController {
    @Autowired
    SysUserService sysUserService;

    @ApiOperation(value = "获取全部用户列表")
    @GetMapping("findAll")
    public Result<List<SysUser>> findAll() {
        List<SysUser> userList = sysUserService.list();

        return Result.ok(userList);
    }

    @ApiOperation(value = "获取分页列表")
    @GetMapping("/{page}/{limit}")
    public Result findPage(
            @ApiParam(name = "page", value = "当前页码", required = true)
            @PathVariable Long page,

            @ApiParam(name = "limit", value = "每页记录数", required = true)
            @PathVariable Long limit,

            @ApiParam(name = "roleQueryVo", value = "查询对象", required = false)
            SysUserQueryVo roleQueryVo
    ) {
        Page<SysUser> pageParam = new Page<>(page, limit);
        IPage<SysUser> pageResult = sysUserService.selectPage(pageParam, roleQueryVo);
        return Result.ok(pageResult);
    }

    @ApiOperation(value = "根据id获取用户")
    @GetMapping("/get/{id}")
    public Result get(@PathVariable String id) {
        SysUser user = sysUserService.getById(id);
        return Result.ok(user);
    }

    @ApiOperation(value = "保存用户")
    @PostMapping("/save")
    public Result save(@RequestBody SysUser sysUser) {
        // 将输入的用户密码进行加密MD5
        String passwordMD5 = MD5.MD5Encode(sysUser.getPassword(), "UTF-8");
        sysUser.setPassword(passwordMD5);
        boolean save = sysUserService.save(sysUser);
        if (save) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "更新用户")
    @PutMapping("/update")
    public Result update(@RequestBody SysUser sysUser) {

        boolean update = sysUserService.updateById(sysUser);
        if (update) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "删除用户")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Long id) {
        boolean delete = sysUserService.removeById(id);
        if (delete) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "批量删除用户")
    @DeleteMapping("/batchRemove")
    public Result batchRemove(@RequestBody List<Long> idList) {
        boolean remove = sysUserService.removeByIds(idList);
        if (remove) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }

    @ApiOperation(value = "更新状态")
    @GetMapping("updateStatus/{id}/{status}")
    public Result updateStatus(
            @PathVariable("id") Long id, @PathVariable("status") Integer status
    ) {
        boolean update = sysUserService.updateStatus(id, status);
        if (update) {
            return Result.ok();
        } else {
            return Result.fail();
        }
    }
}

