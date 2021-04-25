package com.mall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mall.entity.Log;
import com.mall.entity.User;
import com.mall.service.LogService;
import com.mall.service.UserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Api("登录控制类")
@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    @RequestMapping("/login")
    public String login(String uname, String password, HttpSession session, Model model, HttpServletRequest request) {
        User user = userService.select(uname, password);
        Log log = new Log();
        if (user != null) {
            user.setStatus(1);
            userService.updateUser(user);
            session.setAttribute("user",user);
            //登录成功
            //登录日志
            if (uname != null) {
                log.setUsername(uname);
                log.setIp(request.getRemoteAddr());
                log.setBrowser(request.getHeader("user-agent"));
                log.setOs(System.getProperty("os.name"));
                log.setStatus(1);
                logService.add(log);
            }
            return "redirect:/";
        } else {
            //登录失败
            //登录日志
            if (uname != null) {
                log.setUsername(uname);
                log.setIp(request.getRemoteAddr());
                log.setBrowser(request.getHeader("user-agent"));
                log.setOs(System.getProperty("os.name")+System.getProperty("os.version"));
                log.setStatus(0);
                logService.add(log);
            }

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
