package com.mall.service;

import com.mall.entity.OrderShipping;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.vo.DataVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Ykong
 *
 */
public interface OrderShippingService extends IService<OrderShipping> {
    public DataVo<OrderShipping> selectList(Integer page, Integer limit);

    public OrderShipping selectById(Long id);

    public OrderShipping selectByUserId(Long userId);

    public void update(OrderShipping orderShipping);

    public void del(Long id);

    public void addShip(OrderShipping orderShipping);
}
