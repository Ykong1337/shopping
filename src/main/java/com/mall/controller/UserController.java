package com.mall.controller;


import com.mall.entity.Role;
import com.mall.entity.User;
import com.mall.service.RoleService;
import com.mall.service.UserService;
import com.mall.vo.DataVo;
import com.mall.vo.UserVo;
import io.swagger.annotations.Api;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Api("用户控制类")
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/toUser")
    public String toUser(){
        return "back/member";
    }
    /**
     * 查询所有用户
     *
     * @return
     */
    @RequestMapping("/users")
    @ResponseBody

    public DataVo<UserVo> select(Integer page, Integer limit) {
        final DataVo<UserVo> userVoDataVo = userService.selectAll(page, limit);
        return userVoDataVo;
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public boolean add(@RequestBody User user) {
        System.out.println(user);
        userService.add(user);

        return true;
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public boolean delUser(String ids) {
        System.out.println(ids);
        final List<String> idList = Arrays.asList(ids.split(","));
        for (String id : idList) {
            userService.deleteById(Long.parseLong(id));
        }
        return true;
    }
    @RequestMapping("/updateUser")
    @ResponseBody
    public boolean updateUser(@RequestBody User user) {
        userService.updateUser(user);
        return true;
    }

    /**
     * 跳转界面
     */
    @RequestMapping("/toAddUser")
    public String toAddUser(Model model) {
        final List<Role> roles = roleService.select();
        model.addAttribute("roles", roles);
        return "back/member-add";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Long id,Model model) {
        System.out.println(id);
        final UserVo userVo = userService.selectById(id);
        model.addAttribute("userVo", userVo);
        final List<Role> roles = roleService.select();
        model.addAttribute("roles", roles);
        final Long identityId = roleService.selectIdByName(userVo.getIdentity());
        model.addAttribute("identityId", identityId);
        return "back/member-edit";
    }

    @RequestMapping("/toPerson")
    public String toPerson() {
        return "back/person";
    }
}
