package org.ee.common.adapter;

import java.util.Arrays;
import java.util.List;
import org.springframework.util.AntPathMatcher;
/**
 * 忽略token 配置类
 * @author ss_419
 */
public class IgnoreTokenConfig {
    public static final List<String> LIST = Arrays.asList(
            "/error",
            "/actuator/**",
            "/gate/**",
            "/static/**",
            "/anno/**",
            "/**/anno/**",
            "/**/swagger-ui.html",
            "/**/doc.html",
            "/**/webjars/**",
            "/**/v2/api-docs/**",
            "/**/v2/api-docs-ext/**",
            "/**/swagger-resources/**",
            "/menu/router/**"
    );
    private static final AntPathMatcher ANT_PATH_MATCHER = new AntPathMatcher();

    /**
     * 传入一个uri， 判断这个uri是否忽略
     * @param currentUri
     * @return
     */
    public static boolean isIgnoreToken(String currentUri) {
        return isIgnore(LIST, currentUri);
    }

    public static boolean isIgnore(List<String> list, String currentUri) {
        if (list.isEmpty()) {
            return false;
        }
        return list.stream().anyMatch((url) ->
                currentUri.startsWith(url) || ANT_PATH_MATCHER.match(url, currentUri)
        );
    }
}