package com.mall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 操作日志表
 * </p>
 *
 * @author Gee
 * @since 2021-04-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Oplog对象", description="操作日志表")
public class Oplog implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "登录ip")
    private String ip;

    @ApiModelProperty(value = "操作状态")
    private Integer opStatus;

    @ApiModelProperty(value = "操作事件")
    private String opEvent;

    @ApiModelProperty(value = "操作人")
    private String opUser;

    @ApiModelProperty(value = "操作时间")
    private Date createTime;


}
