package org.ee.authority.service.logs;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.ee.authority.entity.system.SysOperLog;
import org.ee.authority.vo.SysOperLogQueryVo;

public interface AsyncOperLogService extends IService<SysOperLog> {


    public void saveSysLog(SysOperLog sysOperLog);

    IPage<SysOperLog> selectPage(Page<SysOperLog> pageParam, SysOperLogQueryVo sysOperLogQueryVo);
}
