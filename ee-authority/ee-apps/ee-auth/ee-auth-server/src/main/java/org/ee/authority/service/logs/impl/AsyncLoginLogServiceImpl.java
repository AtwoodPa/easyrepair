package org.ee.authority.service.logs.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.ee.authority.entity.system.SysLoginLog;
import org.ee.authority.mapper.logs.AsyncLoginLogsMapper;
import org.ee.authority.mapper.system.SysUserMapper;
import org.ee.authority.service.logs.AsyncLoginLogService;
import org.ee.authority.vo.SysLoginLogQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/10 07:57
 */
@Service("asyncLoginLogService")
public class AsyncLoginLogServiceImpl extends ServiceImpl<AsyncLoginLogsMapper, SysLoginLog> implements AsyncLoginLogService {

    @Autowired
    AsyncLoginLogsMapper asyncLoginLogsMapper;

    @Autowired
    SysUserMapper sysUserMapper;

    @Override
    public void recordLoginLog(String username, Integer status, String ipaddr, String message) {
        SysLoginLog sysLoginLog = new SysLoginLog();

        sysLoginLog.setUsername(username);
        sysLoginLog.setStatus(status);
        sysLoginLog.setIpaddr(ipaddr);
        sysLoginLog.setMsg(message);

        asyncLoginLogsMapper.insert(sysLoginLog);
    }

    @Override
    public IPage<SysLoginLog> selectPage(Page<SysLoginLog> pageParam, SysLoginLogQueryVo sysLoginLogQueryVo) {
        return asyncLoginLogsMapper.selectPage(pageParam, sysLoginLogQueryVo);
    }

}
