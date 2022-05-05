package com.mall.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//扫描mapper文件夹

@EnableTransactionManagement
@Configuration
public class MybatisPlusConfig {
//    //注册乐观锁插件
//    @Bean
//    public OptimisticLockerInterceptor optimisticLockerInterceptor() {
//        return new OptimisticLockerInterceptor();
//    }

    //分页插件
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }


//    //SQL执行效率插件
//    @Bean
//    @Profile({"dev", "test"})//设置Dev test环境开启，保证我们的效率
//    public PerformanceInterceptor performanceInterceptor() {
//        final PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
//        performanceInterceptor.setMaxTime(100);//设置sql执行的最大时间，如果超过了不执行
//        performanceInterceptor.setFormat(true);//格式化
//        return performanceInterceptor;
//    }
}
