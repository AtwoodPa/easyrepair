package org.ee.authority.entity.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.ee.authority.entity.base.BaseEntity;

@Data
//@ApiModel(description = "角色菜单")
@TableName("sys_role_menu")
public class SysRoleMenu extends BaseEntity {
	
	private static final long serialVersionUID = 1L;

//	@ApiModelProperty(value = "角色id")
	@TableField("role_id")
	private String roleId;

//	@ApiModelProperty(value = "菜单id")
	@TableField("menu_id")
	private String menuId;

}

