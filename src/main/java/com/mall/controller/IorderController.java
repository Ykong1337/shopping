package com.mall.controller;


import com.mall.entity.*;
import com.mall.service.*;
import com.mall.vo.DataVo;
import com.mall.vo.ItemVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
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
@Api("订单控制类")
@Controller
public class IorderController {
    @Autowired
    private IorderService orderService;
    @Autowired
    private CartService cartService;
    @Autowired
    private OrderShippingService orderShippingService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private ItemService itemService;
    /**
     * 跳转
     */
    @RequestMapping("/toOrder")
    @ApiOperation("前往后台订单列表")
    public String toOrder() {
        return "back/order";
    }

    @RequestMapping("order")
    @ApiOperation("订单分页列表")
    @ResponseBody
    public DataVo<Iorder> selectList(Integer page, Integer limit) {

        return orderService.selectList(page, limit);

    }

    @RequestMapping("addOrder")
    @ApiOperation("添加订单")
    @ResponseBody
    public boolean addOrder(@RequestBody Iorder iorder) {
        orderService.createOrder(iorder);
        return true;
    }

    @RequestMapping("delOrder")
    @ApiOperation("删除订单")
    @ResponseBody
    public boolean delOrder(String ids) {
        System.out.println(ids);
        final List<String> idList = Arrays.asList(ids.split(","));
        for (String id : idList) {
            orderService.delOrder(Long.parseLong(id));
            orderDetailService.delDetailByOrderId(Long.parseLong(id));//订单删除时，详情表中的数据随之删除
        }
        return true;
    }

    @RequestMapping("delOrder1/{id}")
    @ApiOperation("删除订单1")
    public String delOrder1(@PathVariable("id") Long id) {
        System.out.println(id);
        orderService.delOrder(id);
        orderDetailService.delDetailByOrderId(id);
        return "redirect:/toMyOrder";
    }

    @RequestMapping("/updateOrder")
    @ApiOperation("更新订单")
    @ResponseBody
    public boolean updateOrder(@RequestBody Iorder iorder) {
        System.out.println(iorder);
        if (iorder != null) {
            orderService.updateOrder(iorder);
        }
        return true;
    }

    @RequestMapping("/createOrder")
    @ApiOperation("前台下单")
    public String createOrder(HttpSession session, BigDecimal cost) {
        User user = (User) session.getAttribute("user");
        final OrderShipping shipping = orderShippingService.selectByUserId(user.getId());//查询出地址信息
        Iorder iorder = new Iorder();
        iorder.setUserId(user.getId());//为订单赋予用户ID
        iorder.setBuyerNick(user.getUserName());//为订单赋予用户昵称
        iorder.setAddress(shipping.getReceiverAddress());//为订单赋予地址
        iorder.setPayment(cost);//为订单赋予总金额
        orderService.addOrder(iorder);//创建订单
        final List<Cart> cartList = cartService.selectListByUserId(user.getId());//查询出购物车列表
        OrderDetail orderDetail = new OrderDetail();
        for (Cart cart : cartList) {
            final ItemVo itemVo = itemService.selectById(cart.getItemId());
            orderDetail.setItemId(cart.getItemId());//为订单详情赋予商品ID
            orderDetail.setOrderId(iorder.getId());//为订单详情赋予订单ID
            orderDetail.setQuantity(cart.getNum());//为订单详情赋予商品数量
            orderDetail.setCost((itemVo.getPrice()).multiply(BigDecimal.valueOf(cart.getNum())));//为订单详情赋予金额信息
            orderDetailService.addOrderDetail(orderDetail);
            cartService.delCart(cart.getId());
        }
        return "redirect:/toMyOrder";
    }

    /**
     * 跳转
     */
    @RequestMapping("/toAddOrder")
    @ApiOperation("后台前往订单添加页面")
    public String toAddOrder() {
        return "back/order-add";
    }

    @RequestMapping("/toUpdateOrder")
    @ApiOperation("后台前往订单更新页面")
    public String toUpdateOrder(Long id, Model model) {
        System.out.println(id);
        final Iorder order = orderService.selectById(id);
        model.addAttribute("order", order);
        return "back/order-view";
    }

    @RequestMapping("/toCreateOrder")
    @ApiOperation("前台前往下单页面")
    public String toCreateOrder(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        final List<Cart> carts = cartService.selectListByUserId(user.getId());
        model.addAttribute("cartList", carts);
        return "mall/order";
    }

    @RequestMapping("toMyOrder")
    @ApiOperation("前台前往我的订单页面")
    public String toMyOrder(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        final List<Iorder> orderList = orderService.selectByUserId(user.getId());
        model.addAttribute("orderList", orderList);
        return "mall/my-order";
    }
}

