package com.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mall.entity.User;
import com.mall.service.UserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
@Api("登录控制类")
@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public String login(String uname, String password, HttpSession session, Model model) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("uname", uname);
        wrapper.eq("password", password);
        User user = userService.getOne(wrapper);
        if (user != null) {
            user.setStatus(1);
            userService.updateUser(user);
            session.setAttribute("user",user);

            return "redirect:/";
        } else {
//            model.addAttribute("msg", "账号或密码错误！");
            return "mall/login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute("user");
        session.invalidate();
        user.setStatus(0);
        userService.updateUser(user);
        return "redirect:/login";
    }
}
