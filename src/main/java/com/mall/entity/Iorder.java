package com.mall.entity;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;

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
@ApiModel(value="Iorder对象", description="")
public class Iorder implements Serializable {

    private static final long serialVersionUID = 1L;


    @TableId(value = "id", type = IdType.ASSIGN_ID)
    @ApiModelProperty(value = "订单id")
    private Long id;

    @ApiModelProperty(value = "实付金额")
    private BigDecimal payment;


    @ApiModelProperty(value = "订单创建时间")
    //@TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "订单更新时间")
    //@TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "地址")
    private String address;

    @ApiModelProperty(value = "买家昵称")
    private String buyerNick;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;

}
