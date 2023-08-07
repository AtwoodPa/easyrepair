package org.ee.authority.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * TODO Web项目配置类
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/8/2 14:24
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {
    /**
     * 添加跨域的配置
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowCredentials(true)
                .allowedMethods("GET", "HEAD", "POST", "PUT", "DELETE","OPTIONS")
                .maxAge(3600);
    }
}
