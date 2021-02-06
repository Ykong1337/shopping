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
 * 商品表
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Item对象", description="商品表")
public class Item implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "商品ID")
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "商品标题")
    private String title;

    @ApiModelProperty(value = "卖点")
    private String sellPoint;

    @ApiModelProperty(value = "价格")
    private BigDecimal price;

    @ApiModelProperty(value = "库存")
    private Integer num;

    @ApiModelProperty(value = "售卖数量限制")
    private Integer limitNum;

    @ApiModelProperty(value = "图片")
    private String image;

    @ApiModelProperty(value = "分类ID")
    private Long cid;

    @ApiModelProperty(value = "商品状态 1正常 0下架")

    private Integer status;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtUpdate;


}
