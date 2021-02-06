package com.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.mall.mapper")
public class ShoppingMallApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShoppingMallApplication.class, args);
    }

}
