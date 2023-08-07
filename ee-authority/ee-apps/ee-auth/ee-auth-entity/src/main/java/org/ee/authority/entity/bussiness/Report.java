package org.ee.authority.entity.bussiness;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author CoderPan
 * @since 2023-05-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("t_report")
public class Report implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 申请人
     */
    @TableField(value = "username")
    private String username;

    /**
     * 用于根据当前登录的wx用户名称来查询对应的提交记录
     */
    @TableField(value = "nick_name")
    private String nickName;

    /**
     * 联系电话
     */

    @TableField(value = "phone")
    private Long phone;

    /**
     * 报修地址
     */
    @TableField(value = "address")
    private String address;

    /**
     * 设备名称
     */
    @TableField(value = "equName")
    private String equname;

    /**
     * 设备类型
     */
    @TableField(value = "equType")
    private String equtype;

    /**
     * 故障描述
     */
    @TableField(value = "description")
    private String description;

    /**
     * 故障图片
     */
    @TableField(value = "image")
    private String image;

    /**
     * 状态（1：正常 0：停用）
     */
    @TableField(value = "status")
    private Integer status;

    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private Date updateTime;

    /**
     * 删除标记（0:可用 1:已删除）
     */
    @TableField(value = "is_deleted")
    private Integer isDeleted;

    private String openid; // 投票发起人openid


}
