package com.mall.controller;


import com.mall.entity.Cart;
import com.mall.entity.User;
import com.mall.service.CartService;
import com.mall.service.ItemService;
import com.mall.vo.ItemVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Api("购物车控制类")
@Controller
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private ItemService itemService;

    @RequestMapping("/addCart")
    @ApiOperation("添加购物车")
    public String addCart(Long itemId, Integer num, HttpSession session) {
        Cart cart = new Cart();
        final User user = (User) session.getAttribute("user");
        cart.setUserId(user.getId());
        cart.setItemId(itemId);
        cart.setNum(num);
        try {
            if (cartService.addCart(cart)) {
                return "redirect:toCart";
            }
        } catch (Exception e) {
            return "redirect:items";
        }
        return null;
    }

    @RequestMapping("/delCart/{id}")
    @ApiOperation("清空购物车")
    public String delCart(@PathVariable("id") Long id) {
        System.out.println(id);
        cartService.delCart(id);
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
