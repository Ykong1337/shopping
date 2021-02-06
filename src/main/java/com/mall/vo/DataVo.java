package com.mall.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class DataVo<T> implements Serializable {
    private Integer code;
    private String msg;
    private Integer count;
    private List<T> data;
}
