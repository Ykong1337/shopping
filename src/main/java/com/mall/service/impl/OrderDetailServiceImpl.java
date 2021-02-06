package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mall.entity.OrderDetail;
import com.mall.mapper.OrderDetailMapper;
import com.mall.service.OrderDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-02-02
 */
@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Override
    public void updateOrderDetail(OrderDetail orderDetail) {
        orderDetailMapper.updateById(orderDetail);
    }

    @Override
    public void addOrderDetail(OrderDetail orderDetail) {
        orderDetailMapper.insert(orderDetail);
    }

    @Override
    public List<OrderDetail> selectByOrderId(Long orderId) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("order_id", orderId);
        return orderDetailMapper.selectList(wrapper);

    }

    @Override
    public void delDetailByOrderId(Long orderId) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("order_id", orderId);
        orderDetailMapper.delete(wrapper);
    }
}
