package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mall.entity.Item;
import com.mall.entity.Cart;
import com.mall.enums.ResultEnum;
import com.mall.exception.MailException;
import com.mall.mapper.ItemMapper;
import com.mall.mapper.CartMapper;
import com.mall.service.CartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ItemMapper itemMapper;

    @Override
    public List<Cart> selectListByUserId(Long userId) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("user_id", userId);
        final List<Cart> carts = cartMapper.selectList(wrapper);
        return carts;
    }

    @Override
    public Cart selectById(Long id) {
        final Cart cart = cartMapper.selectById(id);
        return cart;
    }


    @Override
    public boolean addCart(Cart cart) {
        Item item = itemMapper.selectById(cart.getItemId());
        final Integer num = item.getNum()- cart.getNum();
        if (num < 0) {
            throw new MailException(ResultEnum.NUM_ERROR);
        }
        item.setNum(num);
        cart.setImg(item.getImage());
        cart.setTitle(item.getTitle());
        cart.setCost(item.getPrice().multiply(BigDecimal.valueOf(cart.getNum())));
        itemMapper.updateById(item);
        if (cartMapper.insert(cart)==1){
            return true;
        }
        return false;
    }

    @Override
    public boolean delCart(Long id) {

        cartMapper.deleteById(id);
        return true;
    }
}
