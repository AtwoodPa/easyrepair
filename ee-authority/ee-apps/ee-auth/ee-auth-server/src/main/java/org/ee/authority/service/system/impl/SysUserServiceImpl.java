package org.ee.authority.service.system.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.ee.authority.entity.system.SysUser;
import org.ee.authority.mapper.system.SysUserMapper;
import org.ee.authority.service.system.SysMenuService;
import org.ee.authority.service.system.SysUserService;
import org.ee.authority.vo.RouterVo;
import org.ee.authority.vo.SysUserQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/8/2 11:46
 */
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {
    @Autowired
    SysUserMapper sysUserMapper;

    @Autowired
    SysMenuService sysMenuService;

    @Override
    public IPage<SysUser> selectPage(Page<SysUser> pageParam, SysUserQueryVo roleQueryVo) {
        return sysUserMapper.selectPage(pageParam, roleQueryVo);
    }

    @Override
    public boolean updateStatus(Long id, Integer status) {
        // 根据id进行查询
        SysUser sysUser = sysUserMapper.selectById(id);
        // 将状态设置到查询出来的用户中
        sysUser.setStatus(status);
        // 更新
        int i = sysUserMapper.updateById(sysUser);
        if (i > 0) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 根据用户名查询登录的用户信息
     * @param username
     * @return
     */
    @Override
    public SysUser getUserInfoByUserName(String username) {
        SysUser sysUser = sysUserMapper.selectOne(new QueryWrapper<SysUser>().eq("username", username));
        return sysUser;
    }

    /**
     * 根据用户名称获取用户信息（基本信息 和 菜单权限 和按钮权限）
     * @param username
     * @return
     */
    @Override
    public Map<String, Object> getUserInfo(String username) {
        // 根据用户名查询用户
        SysUser sysUser = this.getUserInfoByUserName(username);
        // 根据用户id查询 菜单 权限值
        List<RouterVo> routerVoList =  sysMenuService.getUserMenuList(sysUser.getId());
        // 根据用户id查询 按钮 权限值
        List<String> permsList =  sysMenuService.getUserButtonList(sysUser.getId());
        Map<String, Object> map = new HashMap<>();
        map.put("roles","[admin]");
        map.put("name","admin");
        map.put("avatar","https://oss.aliyuncs.com/aliyun_id_photo_bucket/default_handsome.jpg");
        map.put("buttons", permsList);
        map.put("routers", routerVoList);
        return map;
    }

}
