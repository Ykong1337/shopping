package com.mall.service;

import com.mall.entity.OrderDetail;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Gee
 * @since 2021-02-02
 */
public interface OrderDetailService extends IService<OrderDetail> {
    public void updateOrderDetail(OrderDetail orderDetail);

    public void addOrderDetail(OrderDetail orderDetail);

    public List<OrderDetail> selectByOrderId(Long orderId);

    public void delDetailByOrderId(Long orderId);
}
