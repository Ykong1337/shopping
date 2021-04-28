package com.mall.vo;

import com.mall.enums.ResultEnum;
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
    public static <T> DataVo<T> success() {
        return new DataVo(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMsg());
    }
    public static <T> DataVo<T> add() {
        return new DataVo(ResultEnum.ADD_SUCCESS.getCode(), ResultEnum.ADD_SUCCESS.getMsg());
    }
    public static <T> DataVo<T> update() {
        return new DataVo(ResultEnum.UPDATE_SUCCESS.getCode(), ResultEnum.UPDATE_SUCCESS.getMsg());
    }
    public static <T> DataVo<T> del() {
        return new DataVo(ResultEnum.DELETE_SUCCESS.getCode(), ResultEnum.DELETE_SUCCESS.getMsg());
    }
    public static <T> DataVo<T> error() {
        return new DataVo(ResultEnum.ERROR.getCode(), ResultEnum.ERROR.getMsg());
    }
    public static <T> DataVo<T> empty() {
        return new DataVo(ResultEnum.NULL_ERROR.getCode(), ResultEnum.NULL_ERROR.getMsg());
    }
}
