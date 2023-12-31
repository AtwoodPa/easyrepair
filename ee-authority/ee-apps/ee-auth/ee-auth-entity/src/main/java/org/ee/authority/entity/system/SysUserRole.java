package org.ee.authority.entity.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.ee.authority.entity.base.BaseEntity;


@Data
//@ApiModel(description = "用户角色")
@TableName("sys_user_role")
public class SysUserRole extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

//	@ApiModelProperty(value = "角色id")
	@TableField("role_id")
	private String roleId;

//	@ApiModelProperty(value = "用户id")
	@TableField("user_id")
	private String userId;
}

