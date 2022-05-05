package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.entity.OrderShipping;
import com.mall.mapper.OrderShippingMapper;
import com.mall.service.OrderShippingService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.vo.DataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Ykong
 *
 */
@Service
public class OrderShippingServiceImpl extends ServiceImpl<OrderShippingMapper, OrderShipping> implements OrderShippingService {
    @Autowired
    private OrderShippingMapper orderShippingMapper;
    @Override
    public DataVo<OrderShipping> selectList(Integer page,Integer limit) {
        DataVo<OrderShipping> dataVo = new DataVo<>();
        dataVo.setCode(0);
        dataVo.setMsg("");
        IPage<OrderShipping> page1 = new Page<>(page, limit);
        final IPage<OrderShipping> shippingIPage = orderShippingMapper.selectPage(page1, null);
        final long total = shippingIPage.getTotal();
        dataVo.setCount((int) total);
        final List<OrderShipping> records = shippingIPage.getRecords();
        dataVo.setData(records);

        return dataVo;
    }

    @Override
    public OrderShipping selectById(Long id) {
        final OrderShipping shipping = orderShippingMapper.selectById(id);
        return shipping;
    }

    @Override
    public OrderShipping selectByUserId(Long userId) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("user_id", userId);
        final OrderShipping shipping = orderShippingMapper.selectOne(wrapper);
        return shipping;
    }

    @Override
    public void update(OrderShipping orderShipping) {
        orderShippingMapper.updateById(orderShipping);
    }

    @Override
    public void del(Long id) {
        orderShippingMapper.deleteById(id);
    }

    @Override
    public void addShip(OrderShipping orderShipping) {
        orderShippingMapper.insert(orderShipping);
    }
}
