package org.ee.authority.service.logs;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.ee.authority.entity.system.SysLoginLog;
import org.ee.authority.vo.SysLoginLogQueryVo;

/**
 * 异步登录日志服务接口
 * @author Spp
 */
public interface AsyncLoginLogService extends IService<SysLoginLog> {

    /**
     * 记录登录信息
     *
     * @param username 用户名
     * @param status 状态
     * @param ipaddr ip
     * @param message 消息内容
     * @return
     */
    void recordLoginLog(String username, Integer status, String ipaddr, String message);

    IPage<SysLoginLog> selectPage(Page<SysLoginLog> pageParam, SysLoginLogQueryVo sysLoginLogQueryVo);

//    String getSessionId(String code);
//    Result authLogin(WXAuth wxAuth);
//
//    Result userinfo(String token, Boolean refresh);
}
