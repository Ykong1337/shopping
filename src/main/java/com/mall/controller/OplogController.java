package com.mall.controller;


import com.mall.entity.Oplog;
import com.mall.entity.User;
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
 * 操作日志表 前端控制器
 * </p>
 *
 * @author Ykong
 *
 */
@Controller
@RequestMapping("/oplog")
public class OplogController {
    @Autowired
    private OplogService oplogService;

    @RequestMapping("/toOplog")
    public String toOplog() {
        return "back/oplog";
    }
    @RequestMapping("/list")
    @ResponseBody
    public DataVo<Oplog> select(Integer page, Integer limit) {
        return oplogService.selectList(page, limit);
    }

    @RequestMapping("/deleteByIds")
    @ResponseBody
    public DataVo del(String ids, HttpServletRequest request, HttpSession session) {
        if (session != null) {
            Oplog oplog = new Oplog();
            final List<String> idList = Arrays.asList(ids.split(","));
            for (String id : idList) {
                oplogService.del(Integer.valueOf(id));
                oplog.setIp(request.getRemoteAddr());
                oplog.setOpUser(((User) session.getAttribute("user")).getUname());
                oplog.setOpEvent("删除操作日志中第" + id + "条数据");
                oplog.setOpStatus(1);
                oplogService.add(oplog);
            }
            return DataVo.del();
        }
        return DataVo.error();
    }

}

