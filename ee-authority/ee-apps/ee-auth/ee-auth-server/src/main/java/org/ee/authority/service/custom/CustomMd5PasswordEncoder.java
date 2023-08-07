package org.ee.authority.service.custom;

import org.ee.authority.utils.MD5;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * <p>
 * 密码处理
 * </p>
 *
 * @author ss_419
 * @description 自定义密码组件
 */
@Component
public class CustomMd5PasswordEncoder implements PasswordEncoder {

    public String encode(CharSequence rawPassword) {
        return MD5.MD5Encode(rawPassword.toString(),"UTF-8");
    }

    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return encodedPassword.equals(MD5.MD5Encode(rawPassword.toString(),"UTF-8"));
    }

}