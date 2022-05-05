package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.entity.Iorder;
import com.mall.mapper.IorderMapper;
import com.mall.service.IorderService;
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
public class IorderServiceImpl extends ServiceImpl<IorderMapper, Iorder> implements IorderService {
    @Autowired
    private IorderMapper iOrderMapper;
    @Override
    public DataVo<Iorder> selectList(Integer page, Integer limit) {
        DataVo dataVo = new DataVo();
        dataVo.setCode(0);
        dataVo.setMsg("");
        IPage<Iorder> orderIPage = new Page<>(page, limit);
        final IPage<Iorder> orders = iOrderMapper.selectPage(orderIPage, null);
        dataVo.setCount((int) orders.getTotal());

        final List<Iorder> records = orders.getRecords();
        dataVo.setData(records);
        return dataVo;
    }

    @Override
    public List<Iorder> selectByUserId(Long userId) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("user_id", userId);
        wrapper.orderByDesc("create_time");
        final List list = iOrderMapper.selectList(wrapper);
        return list;
    }

    @Override
    public Iorder selectById(Long id) {
        final Iorder iorder = iOrderMapper.selectById(id);
        return iorder;
    }

    @Override
    public void createOrder(Iorder order) {
        iOrderMapper.update(order, null);

    }

    @Override
    public void delOrder(Long id) {
        iOrderMapper.deleteById(id);
    }

    @Override
    public void updateOrder(Iorder order) {
        iOrderMapper.updateById(order);
    }

    @Override
    public void addOrder(Iorder order) {
        iOrderMapper.insert(order);
    }
}
