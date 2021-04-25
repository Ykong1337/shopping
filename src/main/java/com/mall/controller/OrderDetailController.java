package com.mall.controller;


import com.mall.entity.OrderDetail;
import com.mall.service.OrderDetailService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-02-02
 */
@Api("订单详情控制类")
@Controller
public class OrderDetailController {
    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping("/seeDetail")
    public String seeDetail(Long id, Model model) {
        System.out.println(id);
        final List<OrderDetail> detailList = orderDetailService.selectByOrderId(id);
        model.addAttribute("detailList", detailList);
        return "back/order-detail";
    }

    @RequestMapping("/toOrderDetail/{orderId}")
    public String toOrderDetail(@PathVariable("orderId") Long orderId, Model model) {
        final List<OrderDetail> orderDetailList = orderDetailService.selectByOrderId(orderId);
        model.addAttribute("orderDetailList", orderDetailList);
        return "mall/orderDetail";
    }
}

