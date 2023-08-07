package org.ee.authority.service.logs.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.ee.authority.entity.system.SysOperLog;
import org.ee.authority.mapper.logs.SysOperLogMapper;
import org.ee.authority.service.logs.AsyncOperLogService;
import org.ee.authority.vo.SysOperLogQueryVo;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/10 08:22
 */
@Service("asyncOperLogService")
public class AsyncOperLogServiceImpl extends ServiceImpl<SysOperLogMapper, SysOperLog> implements AsyncOperLogService {
    @Resource
    private SysOperLogMapper sysOperLogMapper;

    @Async
    @Override
    public void saveSysLog(SysOperLog sysOperLog) {
        sysOperLogMapper.insert(sysOperLog);
    }

    @Override
    public IPage<SysOperLog> selectPage(Page<SysOperLog> pageParam, SysOperLogQueryVo sysOperLogQueryVo) {
        return sysOperLogMapper.selectPage(pageParam, sysOperLogQueryVo);
    }
}
