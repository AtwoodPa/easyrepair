package org.ee.authority.service.system.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.ee.authority.entity.system.SysRole;
import org.ee.authority.entity.system.SysUserRole;
import org.ee.authority.mapper.system.SysRoleMapper;
import org.ee.authority.mapper.system.SysUserRoleMapper;
import org.ee.authority.service.system.SysRoleService;
import org.ee.authority.vo.AssginRoleVo;
import org.ee.authority.vo.SysRoleQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO 权限Service接口实现类
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/5 10:46
 */
@Service("sysRoleService")
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    /**
     * TODO 条件分页查询实现
     *
     * @param pageParam
     * @param sysRoleQueryVo
     * @return
     */
    @Override
    public IPage<SysRole> selectPage(Page<SysRole> pageParam, SysRoleQueryVo sysRoleQueryVo) {
        IPage<SysRole> pageModel = baseMapper.selectPage(pageParam, sysRoleQueryVo);
        return pageModel;
    }

    @Override
    public Map<String, Object> getRolesByUserId(Long userId) {
        List<SysRole> roles = sysRoleMapper.selectList(null);
        QueryWrapper<SysUserRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", userId);
        // 获取用户已分配的角色
        List<SysUserRole> userRoles = sysUserRoleMapper.selectList(queryWrapper);
        // 获取用户已分配的角色id TODO Long修改为String
        List<String> userRoleIds = new ArrayList<>();
        for (SysUserRole role : userRoles) {
            userRoleIds.add(role.getRoleId());
        }
        // 创建返回的map
        Map<String, Object> map = new HashMap<>();
        map.put("allRoles", roles);
        map.put("userRoleIds", userRoleIds);
        return map;
    }

    @Override
    public void doAssign(AssginRoleVo assginRoleVo) {
//根据用户id删除原来分配的角色
        QueryWrapper<SysUserRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("user_id", assginRoleVo.getUserId());
        sysUserRoleMapper.delete(queryWrapper);
        //获取所有的角色id
        List<String> roleIdList = assginRoleVo.getRoleIdList();
        for (String roleId : roleIdList) {
            if (roleId != null) {
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(assginRoleVo.getUserId());
                sysUserRole.setRoleId(roleId);
                //保存
                sysUserRoleMapper.insert(sysUserRole);
            }
        }
    }
}
