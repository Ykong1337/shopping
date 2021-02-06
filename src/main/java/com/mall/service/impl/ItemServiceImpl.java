package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.entity.Item;
import com.mall.entity.ItemCat;
import com.mall.mapper.ItemCatMapper;
import com.mall.mapper.ItemMapper;
import com.mall.service.ItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.vo.DataVo;
import com.mall.vo.ItemVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Service
public class ItemServiceImpl extends ServiceImpl<ItemMapper, Item> implements ItemService {
    @Autowired
     private ItemMapper itemMapper;
    @Autowired
    private ItemCatMapper itemCatMapper;
    public List<Item> select() {
        final List<Item> items = itemMapper.selectList(null);
        return items;
    }

    @Override
    public ItemVo selectById(Long id) {
        Item item = itemMapper.selectById(id);
        ItemVo itemVo = new ItemVo();
        BeanUtils.copyProperties(item, itemVo);
        final ItemCat select = itemCatMapper.selectById(item.getCid());
        itemVo.setName(select.getName());
        return itemVo;
    }

    @Override
    public void insert(Item item) {
        itemMapper.insert(item);
    }

    @Override
    public int deleteByIds(Long id) {
//        QueryWrapper wrapper = new QueryWrapper();
//        wrapper.eq("id", id);
//        final Item item = itemMapper.selectOne(wrapper);
        final int i = itemMapper.deleteById(id);
        return i;
    }

    @Override
    public void update(Item item) {

        itemMapper.updateById(item);
    }

    @Override
    public List<Item> selectListByCid(Long cid) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("cid", cid);
        final List list = itemMapper.selectList(wrapper);
        return list;
    }

    /**
     * 根据商品名称模糊查询
     * @param page
     * @param limit
     * @param title
     * @return
     */
    @Override
    public List<Item> selectLikeName(String title) {
        QueryWrapper<Item> wrapper = new QueryWrapper<>();
        wrapper.like("title",title);
        final List<Item> itemList = itemMapper.selectList( wrapper);

        return itemList;
    }
}