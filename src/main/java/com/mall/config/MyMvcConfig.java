package com.mall.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

/**
 *
 */
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
    /**
     * 跨域配置
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        //对那些请求路径进行跨域处理
        registry.addMapping("/**")
                // 允许的请求头，默认允许所有的请求头
                .allowedHeaders("*")
                // 允许的方法，默认允许GET、POST、HEAD
                .allowedMethods("*")
                // 探测请求有效时间，单位秒
                .maxAge(1800)
                // 支持的域
                .allowedOrigins("*");
    }

    /**
     * 将static下面的js，css文件加载出来
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //registry.addResourceHandler("/static/").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");

        registry.addResourceHandler("/img/**").addResourceLocations("file:/D:/upload/");
    }


    /**
     * 注册拦截器
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandlerInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/", "/login","/toMore/{id}","/toAllItem","/toInformation","/toAbout","/static/*","toResult","/toCatResult/{id}");
    }
}
