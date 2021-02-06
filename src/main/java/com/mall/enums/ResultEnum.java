package com.mall.enums;

import lombok.Getter;

@Getter
public enum ResultEnum {
    NUM_ERROR(1,"库存不足");
    private Integer code;
    private String msg;

    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
