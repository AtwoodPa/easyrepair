package org.ee.exception.code;

/**
 * @author ss_419
 */
public interface BaseExceptionCode {
    /**
     * 异常编码
     *
     * @return
     */
    int getCode();

    /**
     * 异常消息
     * @return
     */
    String getMsg();
}