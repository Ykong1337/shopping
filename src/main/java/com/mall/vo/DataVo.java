package com.mall.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
public class DataVo<T> implements Serializable {
    private Integer code;
    private String msg;
    private Integer count;
    private List<T> data;

    public DataVo(Integer code, String msg, List<T> data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public DataVo(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
