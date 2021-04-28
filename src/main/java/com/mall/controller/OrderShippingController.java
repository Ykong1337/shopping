package com.mall.controller;


import com.mall.entity.Oplog;
import com.mall.entity.OrderShipping;
import com.mall.entity.User;
import com.mall.service.OplogService;
import com.mall.service.OrderShippingService;
import com.mall.vo.DataVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Api("地址控制类")
@Controller
public class OrderShippingController {
    @Autowired
    private OrderShippingService orderShippingService;
    @Autowired
    private OplogService oplogService;

    @RequestMapping("/ship")
    @ResponseBody
    public DataVo ship(Integer page, Integer limit) {

        return orderShippingService.selectList(page, limit);
    }

    @RequestMapping("/updateShip")
    @ResponseBody
    public DataVo updateShip(@RequestBody OrderShipping orderShipping, HttpServletRequest request, HttpSession session) {
        System.out.println(orderShipping);
        System.out.println("------------"+orderShipping.getReceiverZip());
        if (orderShipping != null) {
            Oplog oplog = new Oplog();
            orderShippingService.update(orderShipping);

            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("更新地址信息");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
            return DataVo.update();
        }
        return DataVo.empty();
    }
    @RequestMapping("/delShip")
    @ResponseBody
    public DataVo delShip(String ids, HttpServletRequest request, HttpSession session) {
        Oplog oplog = new Oplog();
        final List<String> idList = Arrays.asList(ids.split(","));
        for (String id : idList) {
            orderShippingService.del(Long.parseLong(id));
            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("删除了ID为："+id+"的地址信息");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
        }
        return DataVo.del();
    }
    @RequestMapping("/addShip")
    @ResponseBody
    public DataVo addShip(@RequestBody OrderShipping orderShipping, HttpServletRequest request, HttpSession session) {
        if (orderShipping != null) {
            Oplog oplog = new Oplog();
            orderShippingService.addShip(orderShipping);
            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("新增地址信息");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
            return DataVo.add();
        }
        return DataVo.empty();
    }

    @RequestMapping("/toShip")
    public String toShip() {
        return "back/ship";
    }


    @RequestMapping("/toUpdateShip")
    public String toUpdateShip(Long id, Model model) {
        final OrderShipping shipping = orderShippingService.selectById(id);
        model.addAttribute("shipping", shipping);
        return "back/ship-view";
    }

    @RequestMapping("/toViewShip")
    public String toViewShip(HttpSession session,Model model) {
        User user = (User) session.getAttribute("user");
        final OrderShipping shipping = orderShippingService.selectByUserId(user.getId());
        if (shipping != null) {
            model.addAttribute("ship", shipping);
            return "mall/ship";
        }
        return "redirect:/toAddShip";
    }
    @RequestMapping("/toAddShip")
    public String toAddShip() {
        return "mall/ship-add";
    }
}

