package com.mall.service;

import com.mall.entity.Cart;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Ykong
 *
 */
public interface CartService extends IService<Cart> {
    public List<Cart> selectListByUserId(Long userId);

    public Cart selectById(Long id);

    public boolean addCart(Cart cart);

    public boolean delCart(Long id);
}
