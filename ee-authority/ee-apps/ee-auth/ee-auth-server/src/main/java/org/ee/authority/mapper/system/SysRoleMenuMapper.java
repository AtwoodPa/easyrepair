package org.ee.authority.mapper.system;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import org.ee.authority.entity.system.SysRoleMenu;
import org.springframework.stereotype.Repository;

import java.io.RandomAccessFile;

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
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {


}
