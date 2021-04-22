package com.mall.controller;

import com.mall.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Api("前台跳转控制类")
@Controller
public class IndexController {
    /**
     * 前台
     * @return
     */


    /**
     * 后台
     *
     * @return
     */
    @RequestMapping("/back")
    @ApiOperation("前往后台")
    public String back(HttpSession session) {
        final User user = (User) session.getAttribute("user");
        if (user.getIdentity() == 1) {
            return "back/index";
        } else {
            return "redirect:/";
        }

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
