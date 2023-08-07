package org.ee.authority.service.system.impl;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.ee.authority.entity.system.SysMenu;
import org.ee.authority.entity.system.SysRoleMenu;
import org.ee.authority.mapper.system.SysMenuMapper;
import org.ee.authority.mapper.system.SysRoleMenuMapper;
import org.ee.authority.service.system.SysMenuService;
import org.ee.authority.utils.MenuHelper;
import org.ee.authority.utils.RouterHelper;
import org.ee.authority.vo.AssginMenuVo;
import org.ee.authority.vo.RouterVo;
import org.ee.exception.AtwoodException;
import org.ee.exception.code.ResultCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ss_419
 */
@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
    @Autowired
    SysMenuMapper sysMenuMapper;

    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public List<SysMenu> findSysMenuByRoleId(Long roleId) {
        //获取所有status为1的权限列表
        List<SysMenu> menuList = sysMenuMapper.selectList(new QueryWrapper<SysMenu>().eq("status", 1));
        //根据角色id获取角色权限
        List<SysRoleMenu> roleMenus = sysRoleMenuMapper.selectList(new QueryWrapper<SysRoleMenu>().eq("role_id",roleId));
        //获取该角色已分配的所有权限id
        List<Long> roleMenuIds = new ArrayList<>();
        for (SysRoleMenu roleMenu : roleMenus) {
            roleMenuIds.add(Long.parseLong(roleMenu.getMenuId()));
        }
        //遍历所有权限列表
        for (SysMenu sysMenu : menuList) {
            if(roleMenuIds.contains(sysMenu.getId())){
                //设置该权限已被分配
                sysMenu.setSelect(true);
            }else {
                sysMenu.setSelect(false);
            }
        }
        //将权限列表转换为权限树
        List<SysMenu> sysMenus = MenuHelper.buildTree(menuList);
        return sysMenus;
    }

    @Override
    public void doAssign(AssginMenuVo assginMenuVo) {
        //删除已分配的权限
        sysRoleMenuMapper.delete(new QueryWrapper<SysRoleMenu>().eq("role_id",assginMenuVo.getRoleId()));
        //遍历所有已选择的权限id
        for (String menuId : assginMenuVo.getMenuIdList()) {
            if(menuId != null){
                //创建SysRoleMenu对象
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setMenuId(menuId);
                sysRoleMenu.setRoleId(assginMenuVo.getRoleId());
                //添加新权限
                sysRoleMenuMapper.insert(sysRoleMenu);
            }
        }
    }

    /**
     * TODO 多表联查获取Menu数据
     * @param userId
     * @return
     */
    @Override
    public List<RouterVo> getUserMenuList(String userId) {
        //超级管理员admin账号id为：1
        List<SysMenu> sysMenuList = null;
        if (userId.equals("1")) {
            sysMenuList =
                    baseMapper.selectList(
                            new QueryWrapper<SysMenu>()
                            .eq("status", 1)
                            .orderByAsc("sort_value"));
        } else {
            sysMenuList = baseMapper.findListByUserId(userId);
        }
        //构建树形数据
        List<SysMenu> sysMenuTreeList = MenuHelper.buildTree(sysMenuList);

        //构建路由
        List<RouterVo> routerVoList = RouterHelper.buildRouters(sysMenuTreeList);
        return routerVoList;
    }

    @Override
    public List<String> getUserButtonList(String userId) {

        //超级管理员admin账号id为：1
        List<SysMenu> sysMenuList = null;
        if (userId.equals("1")) {
            sysMenuList = sysMenuMapper.selectList(new QueryWrapper<SysMenu>().eq("status", 1));
        } else {
            sysMenuList = sysMenuMapper.findListByUserId(userId);
        }
        //创建返回的集合
        List<String> permissionList = new ArrayList<>();
        for (SysMenu sysMenu : sysMenuList) {
            if(sysMenu.getType() == 2){
                permissionList.add(sysMenu.getPerms());
            }
        }
        return permissionList;
    }

    @Override
    public List<SysMenu> findNodes() {
        //全部权限列表
        List<SysMenu> sysMenuList = baseMapper.selectList(null);
        if (CollectionUtils.isEmpty(sysMenuList)) {
            return null;
        }

        //构建树形数据
        List<SysMenu> result = MenuHelper.buildTree(sysMenuList);
        return result;
    }

    @Override
    public void removeMenuById(Long id) {
        QueryWrapper<SysMenu> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("parent_id", id);
        Long aLong = sysMenuMapper.selectCount(queryWrapper);
        if (aLong > 0) {
            throw new AtwoodException(ResultCodeEnum.FAIL, "请先删除子菜单");
        }
//        Integer count = baseMapper.selectCount(queryWrapper);
//        if (count > 0){
//            throw new AtwoodException(ResultCodeEnum.FAIL,"请先删除子菜单");
//        }
    }

    @Override
    public boolean removeById(Serializable id) {
//        int count = this.count(new QueryWrapper<SysMenu>()
//                    .eq("parent_id", id));
//        if (count > 0) {
//            throw new AtwoodException(ResultCodeEnum.NODE_ERROR,"请先删除子菜单");
//        }
        QueryWrapper<SysMenu> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("parent_id", id);
        Long aLong = sysMenuMapper.selectCount(queryWrapper);
        if (aLong > 0) {
            throw new AtwoodException(ResultCodeEnum.FAIL, "请先删除子菜单");
        }
        sysMenuMapper.deleteById(id);
        return false;
    }
}