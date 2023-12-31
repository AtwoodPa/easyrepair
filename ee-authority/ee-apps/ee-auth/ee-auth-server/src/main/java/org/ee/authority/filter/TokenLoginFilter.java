package org.ee.authority.filter;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.ee.authority.service.custom.CustomUser;
import org.ee.authority.service.logs.AsyncLoginLogService;
import org.ee.authority.utils.IpUtil;
import org.ee.authority.utils.JwtHelper;
import org.ee.authority.utils.ResponseUtil;
import org.ee.authority.vo.LoginVo;
import org.ee.base.Result;
import org.ee.exception.code.ResultCodeEnum;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * TODO 登录过滤器，继承UsernamePasswordAuthenticationFilter，对用户名密码进行登录校验
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/9 21:47
 *
 *
 */
public class TokenLoginFilter extends UsernamePasswordAuthenticationFilter {

    private RedisTemplate redisTemplate;

    private AsyncLoginLogService asyncLoginLogService;

//    public TokenLoginFilter(AuthenticationManager authenticationManager) {
//        this.setAuthenticationManager(authenticationManager);
//        this.setPostOnly(false);
//        //TODO 指定登录接口及提交方式，可以指定任意路径
//        // 将默认的登录页面的url设置为登录提交地址
//        this.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/admin/system/index/login","POST"));
//    }
public TokenLoginFilter(AuthenticationManager authenticationManager, RedisTemplate redisTemplate,AsyncLoginLogService asyncLoginLogService) {
    this.setAuthenticationManager(authenticationManager);
    this.setPostOnly(false);
    //指定登录接口及提交方式，可以指定任意路径
    this.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/admin/system/index/login","POST"));
    this.redisTemplate = redisTemplate;
    this.asyncLoginLogService = asyncLoginLogService;
}

    /**
     * TODO 登录认证
     * @param req
     * @param res
     * @return
     * @throws AuthenticationException
     */
    @Override
    public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res)
            throws AuthenticationException {
        try {
            // 通过流的方式获取到登录对象
            LoginVo loginVo = new ObjectMapper().readValue(req.getInputStream(), LoginVo.class);
            // 获取用户名和密码
            Authentication authenticationToken = new UsernamePasswordAuthenticationToken(loginVo.getUsername(), loginVo.getPassword());
            return this.getAuthenticationManager().authenticate(authenticationToken);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * TODO 登录成功
     * @param request
     * @param response
     * @param chain
     * @param auth
     * @throws IOException
     * @throws ServletException
     */
    @Override
    protected void successfulAuthentication(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain chain,
            Authentication auth) throws IOException, ServletException {
        // 获取认证对象
        CustomUser customUser = (CustomUser) auth.getPrincipal();
        // 根据认证对象生成token
        String token = JwtHelper.createToken(customUser.getSysUser().getId(), customUser.getSysUser().getUsername());

        //认证成功后，保存权限数据
        redisTemplate.opsForValue().set(customUser.getUsername(), JSON.toJSONString(customUser.getAuthorities()));
        //记录日志
        asyncLoginLogService.recordLoginLog(customUser.getUsername(), 1, IpUtil.getIpAddress(request), "登录成功");

        // 返回token
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        ResponseUtil.out(response, Result.ok(map));
    }

    /**
     * 登录失败
     * @param request
     * @param response
     * @param e
     * @throws IOException
     * @throws ServletException
     */
    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
                                              AuthenticationException e) throws IOException, ServletException {

        if(e.getCause() instanceof RuntimeException) {
            ResponseUtil.out(response, Result.build(null, 204, e.getMessage()));
        } else {
            ResponseUtil.out(response, Result.build(null, ResultCodeEnum.LOGIN_MOBLE_ERROR));
        }
    }

}
