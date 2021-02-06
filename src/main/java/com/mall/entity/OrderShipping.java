package com.mall.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="OrderShipping对象", description="")
public class OrderShipping implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "用户ID")
    private Long userId;

    @ApiModelProperty(value = "收货人全名")
    private String receiverName;

    @ApiModelProperty(value = "移动电话")
    private String receiverMobile;

    @ApiModelProperty(value = "收货地址")
    private String receiverAddress;

    @ApiModelProperty(value = "邮政编码,如：310001")
    private String receiverZip;

    @TableField(fill = FieldFill.INSERT)
    private Date created;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updated;


}
