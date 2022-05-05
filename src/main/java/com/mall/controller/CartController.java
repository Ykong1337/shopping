package com.mall.controller;


import com.mall.entity.Cart;
import com.mall.entity.Item;
import com.mall.entity.Oplog;
import com.mall.entity.User;
import com.mall.service.CartService;
import com.mall.service.ItemService;
import com.mall.service.OplogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Ykong
 *
 */
@Api("购物车控制类")
@Controller
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private OplogService oplogService;

    @RequestMapping("/addCart")
    @ApiOperation("添加购物车")
    public String addCart(Long itemId, Integer num, HttpSession session, HttpServletRequest request) {
        Cart cart = new Cart();
        Oplog oplog = new Oplog();
        final User user = (User) session.getAttribute("user");
        oplog.setIp(request.getRemoteAddr());
        oplog.setOpUser(user.getUname());
        cart.setUserId(user.getId());
        cart.setItemId(itemId);
        cart.setNum(num);
        //判断库存是否还有
        final Item item = itemService.selectByItemId(itemId);

        if (item.getNum() > 0) {
            if (cartService.addCart(cart)) {
                //日志
                oplog.setOpEvent("将商品:"+item.getTitle()+"加入到购物车");
                oplog.setOpStatus(1);
                oplogService.add(oplog);
                return "redirect:toCart";
            }else {
                //日志
                oplog.setOpEvent("将商品:"+item.getTitle()+"加入到购物车");
                oplog.setOpStatus(0);
                oplogService.add(oplog);
                return "redirect:items";
            }
        }else {
            //日志
            oplog.setOpEvent("商品:"+item.getTitle()+"库存不足,无法加入购物车");
            oplog.setOpStatus(0);
            oplogService.add(oplog);
            return "redirect:/";
        }
    }

    @RequestMapping("/delCart/{id}")
    @ApiOperation("删除购物车不想买的商品")
    public String delCart(@PathVariable("id") Long id,HttpSession session,HttpServletRequest request) {
        Oplog oplog = new Oplog();
        final Cart cart = cartService.selectById(id);
        final Item item = itemService.selectByItemId(cart.getItemId());
        cartService.delCart(id);
        item.setNum(item.getNum()+cart.getNum());
        //日志
        oplog.setIp(request.getRemoteAddr());
        oplog.setOpUser(((User) session.getAttribute("user")).getUname());
        oplog.setOpEvent("删除了购物车中第" + id + "条数据，商品名称为："+item.getTitle());
        oplog.setOpStatus(1);
        oplogService.add(oplog);

        itemService.update(item);
        return "redirect:/toCart";
    }

    @RequestMapping("/toCart")
    @ApiOperation("前台前往查看购物车")
    public String toCart(HttpSession session,Model model) {
        final User user = (User) session.getAttribute("user");
        final List<Cart> cartList = cartService.selectListByUserId(user.getId());
        model.addAttribute("cartList", cartList);
        return "mall/shopcart";
    }
}

