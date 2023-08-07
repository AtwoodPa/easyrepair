package org.ee.exception;

import lombok.Data;
import org.ee.exception.code.ResultCodeEnum;


/**
 * TODO
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/8 14:41
 */
@Data
public class AtwoodException extends RuntimeException {

    private ResultCodeEnum resultCodeException;
    private String message;
    public AtwoodException(ResultCodeEnum resultCodeEnum, String message) {
        this.resultCodeException = resultCodeEnum;
        this.message = message;
    }

}
