package org.ee.authority.mapper.logs;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import org.ee.authority.entity.system.SysOperLog;
import org.ee.authority.vo.SysOperLogQueryVo;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-07
 */
@Repository
@Mapper
public interface SysOperLogMapper extends BaseMapper<SysOperLog> {

    IPage<SysOperLog> selectPage(Page<SysOperLog> page, @Param("vo") SysOperLogQueryVo sysOperLogQueryVo);


}
