package com.mall.mapper;

import com.mall.entity.ItemCat;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 商品类目 Mapper 接口
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
public interface ItemCatMapper extends BaseMapper<ItemCat> {
    public Long selectIdByName(String name);
}
