package com.mall.enums;

import lombok.Getter;

@Getter
public enum ResultEnum {
    SUCCESS(200, "请求成功"),
    ADD_SUCCESS(200, "数据添加成功"),
    UPDATE_SUCCESS(200, "数据修改成功"),
    DELETE_SUCCESS(200, "数据删除成功"),
    ERROR(400, "请求失败"),
    NULL_ERROR(400, "请求数据为空"),
    NUM_ERROR(1,"库存不足");
    private Integer code;
    private String msg;

    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
