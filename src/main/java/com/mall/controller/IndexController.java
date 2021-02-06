package com.mall.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Api("前台跳转控制类")
@Controller
public class IndexController {
    /**
     * 前台
     * @return
     */



    /**
     * 后台
     * @return
     */
    @RequestMapping("/back")
    @ApiOperation("前往后台")
    public String back() {
        return "back/index";
    }

    @RequestMapping("/toWelcome")
    @ApiOperation("欢迎页")
    public String toWelcome(){
        return "back/welcome";
    }

    @RequestMapping("/toAbout")
    @ApiOperation("关于页")
    public String toAbout(){
        return "mall/about";
    }

    @RequestMapping("/toInformation")
    @ApiOperation("信息页")
    public String toInformation(){
        return "mall/information";
    }

}
