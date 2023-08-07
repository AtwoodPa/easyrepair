package org.ee.authority.service.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.ee.authority.entity.system.SysUser;
import org.ee.authority.vo.SysUserQueryVo;


import java.util.Map;


/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-07
 */
public interface SysUserService extends IService<SysUser> {

    IPage<SysUser> selectPage(Page<SysUser> pageParam, SysUserQueryVo roleQueryVo);

    boolean updateStatus(Long id, Integer status);

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    SysUser getUserInfoByUserName(String username);

    Map<String, Object> getUserInfo(String username);
}
