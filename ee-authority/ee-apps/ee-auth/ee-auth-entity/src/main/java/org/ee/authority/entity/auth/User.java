package org.ee.authority.entity.auth;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.*;

@Data
@ApiModel(description = "用户实体")
public class User {
    @NotNull(message = "用户id不能为空")
    @ApiModelProperty(value = "主键")
    private int id;
    @NotEmpty(message = "姓名不能为空")
    @ApiModelProperty(value = "姓名")
    private String name;
    @Max(value = 80,message = "年龄最大为80岁")
    @Min(value = 1,message = "年龄最小为1岁")
    @ApiModelProperty(value = "年龄")
    private int age;

    @ApiModelProperty(value = "地址")
    private String address;

    @Pattern(regexp = "[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$",
            message = "邮箱格式不正确")
    private String email;
}