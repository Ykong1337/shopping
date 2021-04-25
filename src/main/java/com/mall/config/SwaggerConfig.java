package com.mall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
import org.springframework.web.context.request.async.DeferredResult;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;

@EnableSwagger2
@Configuration
public class SwaggerConfig {
    @Bean
    public Docket ProductApi() {
    return new Docket(DocumentationType.SWAGGER_2)
                        .genericModelSubstitutes(DeferredResult.class)
                        .useDefaultResponseMessages(false)
                        .forCodeGeneration(false)
                        .pathMapping("/")
                        .select()
                        .build()
                        .apiInfo(productApiInfo());
    }
    private ApiInfo productApiInfo() {
        ApiInfo apiInfo = new ApiInfo("Gee电子产品销售系统数据接口文档",
                "文档描述。。。",
                "1.0.0",
                "API TERMS URL",
                "2289249101@qq.com",
                "license",
                "license url");
        return apiInfo;
    }
}
