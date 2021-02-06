package com.mall.exception;

import com.mall.enums.ResultEnum;

public class MailException extends RuntimeException {
    public MailException(String error) {
        super(error);
    }
    public MailException(ResultEnum resultEnum) {
        super(resultEnum.getMsg());
    }
}
