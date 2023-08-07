package org.ee.authority.service.system;


import com.baomidou.mybatisplus.extension.service.IService;
import org.ee.authority.entity.system.SysMenu;
import org.ee.authority.vo.AssginMenuVo;
import org.ee.authority.vo.RouterVo;


import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-08
 */
public interface SysMenuService extends IService<SysMenu> {
    /**
     * 菜单树形数据
     * @return
     */
    List<SysMenu> findNodes();

    void removeMenuById(Long id);


    /**
     * 根据角色获取授权权限数据
     * @return
     */
    List<SysMenu> findSysMenuByRoleId(Long roleId);

    /**
     * 保存角色权限
     * @param  assginMenuVo
     */
    void doAssign(AssginMenuVo assginMenuVo);

    List<RouterVo> getUserMenuList(String id);

    List<String> getUserButtonList(String id);
}
