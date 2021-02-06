package com.mall.service;

import com.mall.entity.Item;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.vo.DataVo;
import com.mall.vo.ItemVo;

import java.util.Collection;
import java.util.List;

/**
 * <p>
 * 商品表 服务类
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
public interface ItemService extends IService<Item> {
    /**
     * 查询所有商品
     * @return
     */
    public List<Item> select();

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    public ItemVo selectById(Long id);

    /**
     * 通过名字模糊查询
     *
     * @return
     */
    public List<Item> selectLikeName(String title);

    /**
     * 增加数据
     * @param item
     */
    public void insert(Item item);

    /**
     * 删除数据
     *
     * @return
     */
    public int deleteByIds(Long id);

    /**
     * 修改数据
     * @param item
     * @return
     */
    public void update(Item item);

    List<Item> selectListByCid(Long cid);
}
