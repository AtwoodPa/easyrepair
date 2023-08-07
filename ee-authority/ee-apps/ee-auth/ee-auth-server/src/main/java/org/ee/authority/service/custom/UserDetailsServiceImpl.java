package org.ee.authority.service.custom;

import org.ee.authority.entity.system.SysUser;
import org.ee.authority.service.system.SysMenuService;
import org.ee.authority.service.system.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/8/2 11:42
 */
@Component

public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private SysUserService sysUserService;
    /**
     * 用于 => 用户授权
     */
    @Autowired
    private SysMenuService sysMenuService;
    /**
     * 根据用户名查询 用户信息
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser sysUser = sysUserService.getUserInfoByUserName(username);
        if (sysUser == null){
            throw new UsernameNotFoundException("用户不存在");
        }
        if (sysUser.getStatus().intValue() == 0){
            throw new LockedException("用户被锁定，请联系管理员");
        }
        // 获取权限列表数据
        List<String> userPermsList = sysMenuService.getUserButtonList(sysUser.getId());

        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (String perm : userPermsList) {
            authorities.add(new SimpleGrantedAuthority(perm.trim()));
        }
        return new CustomUser(sysUser, authorities);
    }
}
