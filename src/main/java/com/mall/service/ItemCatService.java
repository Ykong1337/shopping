package com.mall.service;

import com.mall.entity.ItemCat;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.vo.DataVo;
import com.mall.vo.ItemVo;

import java.util.List;

/**
 * <p>
 * 商品类目 服务类
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
public interface ItemCatService extends IService<ItemCat> {
    public DataVo<ItemVo> selectList(Integer page,Integer limit);

    public Long selectIdByName(String name);

    public List<ItemCat> select();

    public ItemCat selectById(Long id);

    public DataVo<ItemCat> show(Integer page, Integer limit);

    public void update(ItemCat itemCat);

    public void delById(Long id);

    public void add(ItemCat itemCat);
}
