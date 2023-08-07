package org.ee.authority.mapper.system;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import org.ee.authority.entity.system.SysMenu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-08
 */
@Repository
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    List<SysMenu> findListByUserId(@Param("userId") String userId);
}
