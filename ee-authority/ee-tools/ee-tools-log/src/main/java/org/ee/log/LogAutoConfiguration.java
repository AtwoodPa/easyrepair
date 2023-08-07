package org.ee.log;


import lombok.AllArgsConstructor;
import org.ee.log.aspect.SysLogAspect;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

import java.io.Serializable;


/**
 * 日志自动配置
 * <p>
 * 启动条件：
 * 1，存在web环境
 * 2，配置文件中pinda.log.enabled=true
 * 3，配置文件中不存在：ee.log.enabled 值
 *
 */

@EnableAsync
@Configuration
@AllArgsConstructor
@ConditionalOnWebApplication
// 当该属性存在，并且值为true时，才启用自动装配
@ConditionalOnProperty(name = "ee.log.enabled", havingValue = "true", matchIfMissing = true)
public class LogAutoConfiguration {

    @Bean
    @ConditionalOnMissingBean
    public SysLogAspect sysLogAspect() {
        return new SysLogAspect();
    }
}