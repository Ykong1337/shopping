package com.mall.controller;


import com.mall.entity.Log;
import com.mall.entity.Oplog;
import com.mall.entity.User;
import com.mall.service.LogService;
import com.mall.service.OplogService;
import com.mall.vo.DataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 登录日志表 前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-04-25
 */
@Controller
@RequestMapping("/log")
public class LogController {
    @Autowired
    private LogService logService;
    @Autowired
    private OplogService oplogService;

    @RequestMapping("toLog")
    public String toLog() {
        return "back/log";
    }

    @RequestMapping("/list")
    @ResponseBody
    public DataVo<Log> select(Integer page, Integer limit) {
        return logService.selectList(page, limit);
    }

    @RequestMapping("/deleteByIds")
    @ResponseBody
    public DataVo del(String ids, HttpServletRequest request, HttpSession session) {
        Oplog oplog = new Oplog();
        final List<String> idList = Arrays.asList(ids.split(","));
        for (String id : idList) {
            logService.del(Integer.valueOf(id));
            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("删除登录日志中第" + id + "条数据");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
        }
        return DataVo.del();
    }
}

