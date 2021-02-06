package com.mall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
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
    //配置了swagger的Docket的bean实例

    @Bean
    public Docket docket1() {
        return new Docket(DocumentationType.SWAGGER_2).groupName("A");
    }
//    @Bean
//    public Docket docket2() {
//        return new Docket(DocumentationType.SWAGGER_2).groupName("B");
//    }
//    @Bean
//    public Docket docket3() {
//        return new Docket(DocumentationType.SWAGGER_2).groupName("C");
//    }
//    @Bean
    public Docket docket(Environment environment) {
        //设置要显示的Swagger环境
        Profiles profiles = Profiles.of("dev","test");
        //获取项目环境
        boolean flag = environment.acceptsProfiles(profiles);
        //通过environment.acceptsProfiles判断是否处在自己设定的环境当中
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .groupName("gee")
                .enable(flag)//enable是否启动了Swagger，如果未false，则Swagger不能在浏览器中访问
                .select()
                //RequestHandlerSelectors 配置要扫描接口的方式
                //basePackage：指定的包
                //any():扫描全部
                //none()：不扫描
                //withClassAnnotation：扫描类上的注解
                //withMethodAnnotation：//扫描方法上的注解
                .apis(RequestHandlerSelectors.basePackage("com.mall.controller"))
                //过滤路径
                //.paths(PathSelectors.ant("/ysh/**"))
                .build();
    }
    //配置swagger信息=apiInfo
    private ApiInfo apiInfo() {
        //作者信息
        Contact contact = new Contact("gee", "http://baidu.com", "2289249101@qq.com");
        return new ApiInfo("gee的SwaggerAPI文档",
                "再小的帆也能远航",
                "1.0",
                "http://baidu.com", contact,
                "Apache 2.0",
                "http://www.apache.org/licenses/LICENSE-2",
                new ArrayList());
    }
}
