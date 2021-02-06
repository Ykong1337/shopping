package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.entity.Item;
import com.mall.entity.ItemCat;
import com.mall.mapper.ItemCatMapper;
import com.mall.mapper.ItemMapper;
import com.mall.service.ItemCatService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.vo.DataVo;
import com.mall.vo.ItemVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 商品类目 服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Service
public class ItemCatServiceImpl extends ServiceImpl<ItemCatMapper, ItemCat> implements ItemCatService {
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private ItemCatMapper itemCatMapper;

    @Override
    public DataVo<ItemVo> selectList(Integer page,Integer limit) {
        DataVo dataVo = new DataVo();
        dataVo.setCode(0);
        dataVo.setMsg("");
        IPage<Item> itemIPage = new Page<>(page, limit);
        final IPage<Item> itemList = itemMapper.selectPage(itemIPage, null);
        //final List<Item> itemList = itemMapper.selectList(null);
        dataVo.setCount((int) itemList.getTotal());
        final List<Item> itemListRecords = itemList.getRecords();
        List<ItemVo> itemVoList = new ArrayList<>();
        for (Item item : itemListRecords) {
            ItemVo itemVo = new ItemVo();
            BeanUtils.copyProperties(item,itemVo);//把item的数据赋值给itemVo
            QueryWrapper wrapper = new QueryWrapper();
            wrapper.eq("id", item.getCid());
            final ItemCat itemCat = itemCatMapper.selectOne(wrapper);
            if (itemCat != null) {
                itemVo.setName(itemCat.getName());
            }
            itemVoList.add(itemVo);
        }

        dataVo.setData(itemVoList);
        return dataVo;
    }

    @Override
    public Long selectIdByName(String name) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("name", name);
        final ItemCat itemCat = itemCatMapper.selectOne(wrapper);

        return itemCat.getId();
    }

    @Override
    public List<ItemCat> select() {
        return itemCatMapper.selectList(null);
    }

    @Override
    public ItemCat selectById(Long id) {
        return itemCatMapper.selectById(id);
    }


    @Override
    public DataVo<ItemCat> show(Integer page, Integer limit) {
        DataVo dataVo = new DataVo();
        dataVo.setCode(0);
        dataVo.setMsg("");
        IPage<ItemCat> catIPage = new Page<>(page, limit);
        final IPage<ItemCat> itemCatIPage = itemCatMapper.selectPage(catIPage, null);
        dataVo.setCount((int) itemCatIPage.getTotal());
        dataVo.setData(itemCatIPage.getRecords());
        return dataVo;
    }

    @Override
    public void update(ItemCat itemCat) {
        itemCatMapper.updateById(itemCat);
    }

    @Override
    public void delById(Long id) {
        itemCatMapper.deleteById(id);
    }

    @Override
    public void add(ItemCat itemCat) {
        itemCatMapper.insert(itemCat);
    }

}
