package com.mall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 用户角色
 * </p>
 *
 * @author Gee
 * @since 2021-01-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="UserRole对象", description="用户角色")
public class UserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    @TableField("USER_ID")
    private Long userId;

    @TableField("ROLE_ID")
    private Long roleId;


}
