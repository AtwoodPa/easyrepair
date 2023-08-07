package org.ee.authority.mapper.system;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import org.ee.authority.entity.system.SysUserRole;
import org.springframework.stereotype.Repository;

/**
 * @author ss_419
 */
@Repository
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {

}