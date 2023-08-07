package org.ee.authority.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * TODO 维修记录查询实体
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/5/10 12:04
 */
@Data
public class ReportQueryVo  implements Serializable {

    private static final long serialVersionUID = 1L;

    private String keyword;

    private Integer status;

    private String createTimeBegin;
    private String createTimeEnd;
}
