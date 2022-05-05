package com.mall.service;

import com.mall.entity.Iorder;
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
public interface IorderService extends IService<Iorder> {
    public DataVo<Iorder> selectList(Integer page, Integer limit);

    public List<Iorder> selectByUserId(Long userId);

    public Iorder selectById(Long id);
    public void createOrder(Iorder order);

    public void delOrder(Long id);

    public void updateOrder(Iorder order);

    public void addOrder(Iorder order);
}
