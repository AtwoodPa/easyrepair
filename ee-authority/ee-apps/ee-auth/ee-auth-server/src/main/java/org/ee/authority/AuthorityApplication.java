package org.ee.authority;

import org.ee.validator.config.EnableFormValidator;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/7/18 08:36
 */
@SpringBootApplication
@EnableFormValidator// 开启快速失败返回模式
@MapperScan(basePackages = "org.ee.authority.mapper")
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class AuthorityApplication {
    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext context = SpringApplication.run(AuthorityApplication.class, args);
        // 获取环境对象
        ConfigurableEnvironment environment = context.getEnvironment();
        String appName = environment.getProperty("spring.application.name");
        // 获取ip地址
        String port = environment.getProperty("server.port");
        String hostAddress = InetAddress.getLocalHost().getHostAddress();

        //启动完成后在控制台提示项目启动成功，并且输出当前服务对应的swagger接口文档访问地址
        //http://localhost:8080/doc.html
        System.out.println("应用"+appName+"启动成功！swagger地址： http://"+hostAddress + ":"+port + "/doc.html");

    }
}
