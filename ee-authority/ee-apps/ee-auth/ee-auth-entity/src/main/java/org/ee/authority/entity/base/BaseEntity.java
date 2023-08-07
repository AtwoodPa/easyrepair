package org.ee.authority.entity.base;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * TODO 基础实体类
 *
 * @author ss_419
 * @version 1.0
 * @date 2023/8/2 09:46
 */
@Data
public class BaseEntity implements Serializable {

//    @TableId(type = IdType.AUTO)
//    private Long id;

    /**
     * TODO 为了保证js能够处理超过16位数的id，修改为String类型
     */
    // @TableId(type = IdType.AUTO)
    private String id;

    @TableField("create_time")
    private Date createTime;

    @TableField("update_time")
    private Date updateTime;

    @TableLogic  //逻辑删除 默认效果 0 没有删除 1 已经删除
    @TableField("is_deleted")
    private Integer isDeleted;

    @TableField(exist = false)
    private Map<String,Object> param = new HashMap<>();
}
