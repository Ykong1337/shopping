package com.mall.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.Version;
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
 * @since 2021-02-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="OrderDetail对象", description="")
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "订单主键")
    private Long orderId;

    @ApiModelProperty(value = "商品主键")
    private Long itemId;

    @ApiModelProperty(value = "数量")
    private Integer quantity;

    @ApiModelProperty(value = "消费")
    private BigDecimal cost;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;

}
