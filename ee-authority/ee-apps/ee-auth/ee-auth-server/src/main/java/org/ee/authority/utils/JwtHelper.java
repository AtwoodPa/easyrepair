package org.ee.authority.utils;


import org.bouncycastle.util.encoders.Base64;
import org.springframework.util.StringUtils;
import io.jsonwebtoken.*;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import java.util.Date;

/**
 * 生成JSON Web令牌的工具类
 */
public class JwtHelper {

    //token过期时间
    private static long tokenExpiration = 24 * 60 * 60 * 1000;
    //加密秘钥
    private static String tokenSignKey = "8677df7fc3a34e26a61c034d5ec8245d";
//    private static String tokenSignKey = "123456";

    //根据用户id和用户名称生成token字符串
    public static String createToken(String userId, String username) {

        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        String token = Jwts.builder()
                .setSubject("AUTH-USER")
                .setIssuer("P_P") // 签发者
                .setIssuedAt(now) // 签发时间
                .claim("userId", userId)
                .claim("username", username)
                .signWith(SignatureAlgorithm.HS256, tokenSignKey)
                .setExpiration(new Date(System.currentTimeMillis() + tokenExpiration))

                .compressWith(CompressionCodecs.GZIP)
                .compact();
        return token;
    }

    //从token字符串获取userid
    public static String getUserId(String token) {
        try {
            if (StringUtils.isEmpty(token)) return null;

            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
            Claims claims = claimsJws.getBody();
            String userId = (String) claims.get("userId");
            return userId;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //从token字符串获取username
    public static String getUsername(String token) {
        try {
            if (StringUtils.isEmpty(token)) return "";

            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
            Claims claims = claimsJws.getBody();
            return (String) claims.get("username");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public static boolean verify(String token) {
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
        Claims claims = claimsJws.getBody();
        String userId = (String) claims.get("userId");
        String username = (String) claims.get("username");
        if (!StringUtils.isEmpty(userId) && !StringUtils.isEmpty(username)) {
            return true;
        }else {
            return false;
        }
    }
    /**
     * 生成加密Key
     * @return
     */
    public static SecretKey generalKey() {
        byte[] encodedKey = Base64.decode(tokenSignKey);
        SecretKey key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
        return key;
    }

    /**
     * 解析JWT字符串
     * @param jwt
     * @return
     */
    public static Claims parseJWT(String jwt){
        SecretKey secretKey = generalKey();
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(jwt)
                .getBody();
    }


    public static void main(String[] args) {
        String token = JwtHelper.createToken("oQdDP5OcQX2m9W7LN1KTmW2iMQdc", "00101010");
        System.out.println(token);
        Claims claims = JwtHelper.parseJWT(token);
        System.out.println("claims = " + claims);
        String userId = JwtHelper.getUserId(token);
        System.out.println(userId);

        String username = JwtHelper.getUsername(token);
        System.out.println(username);
    }
}
