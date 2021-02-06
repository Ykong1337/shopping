package com.mall.controller;


import com.mall.entity.Item;
import com.mall.entity.ItemCat;
import com.mall.service.ItemCatService;
import com.mall.service.ItemService;
import com.mall.vo.DataVo;
import com.mall.vo.ItemVo;
import io.swagger.annotations.Api;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 商品表 前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Api("商品控制类")
@Controller
public class ItemController {
    @Autowired
    private ItemService itemService;
    @Autowired
    private ItemCatService itemCatService;

    /**
     * 前后端分离
     *
     * @return
     */
    @RequestMapping("/item")
    @ResponseBody
    public DataVo select(Integer page, Integer limit) {
        return itemCatService.selectList(page, limit);

    }


    @RequestMapping("/add")
    @ResponseBody
    public boolean add(@RequestBody Item item) {
        if (item != null) {
            System.out.println(item);
            System.out.println(item.getCid());
            itemService.insert(item);
        } else {
            System.out.println("未接收到数据!");
        }
        return true;
    }

    @RequestMapping("/deleteByIds")
    @ResponseBody
    public boolean del(String ids) {
        System.out.println(ids);
        final List<String> idList = Arrays.asList(ids.split(","));
        for (String id : idList) {
            itemService.deleteByIds(Long.parseLong(id));
        }

        return true;
    }

    @RequestMapping("/update")
    @ResponseBody
    public boolean update(@RequestBody Item item) {
        System.out.println(item);
        System.out.println((item.getSellPoint()));
        itemService.update(item);
        return true;
    }

    /**
     * 跳转界面
     */
    @RequestMapping("/toItem")
    public String toItem() {
        return "back/item";
    }

    @RequestMapping("/toInsert")
    public String toInsert(Model model) {
        final List<ItemCat> select = itemCatService.select();
        model.addAttribute("select", select);
        return "back/item-add";
    }

    @GetMapping("/toUpdate")
    public String toUpdate(Long id, Model model) {
        System.out.println(id);
        final ItemVo itemVo = itemService.selectById(id);
        model.addAttribute("itemVo", itemVo);
        //为选择框传入默认分类id
        final String cname = itemVo.getName();
        final Long catId = itemCatService.selectIdByName(cname);
        model.addAttribute("catId", catId);
        //为选择框传入分类id和分类名
        final List<ItemCat> select = itemCatService.select();
        model.addAttribute("select", select);
        return "back/item-view";
    }

    @RequestMapping("/toMore/{id}")
    public String toMore(@PathVariable("id") Long id, Model model) {
        final ItemVo itemVo = itemService.selectById(id);
        model.addAttribute("product", itemVo);
        return "mall/single";
    }

    /**
     * 进入网站首页
     *
     * @param model
     * @return
     */
    @RequestMapping("/")
    public String select2(Model model) {
        final List<Item> items = itemService.select();
        model.addAttribute("list", items);
        final List<ItemCat> catList = itemCatService.select();
        model.addAttribute("catList", catList);
        return "mall/index";
    }

    /**
     * 所有商品
     */
    @RequestMapping("/toAllItem")
    public String toAllItem(Model model) {
        final List<ItemCat> catList = itemCatService.select();
        model.addAttribute("catList", catList);
        final List<Item> itemList = itemService.select();
        model.addAttribute("itemList", itemList);
        return "mall/commodity";
    }

    /**
     * 查询结果页
     */
    @RequestMapping("/toResult")
    public String toResult(String title, Model model) {
        final List<Item> itemList = itemService.selectLikeName(title);
        model.addAttribute("itemList", itemList);
        final List<ItemCat> cats = itemCatService.select();
        model.addAttribute("cats", cats);
        return "mall/result";
    }
    /**
     * 根据分类查出商品
     */
    @RequestMapping("/toCatResult/{id}")
    public String toCatResult(@PathVariable("id") Long id, Model model) {
        final List<Item> itemList = itemService.selectListByCid(id);
        model.addAttribute("itemList", itemList);
        final List<ItemCat> cats = itemCatService.select();
        model.addAttribute("cats", cats);
        return "mall/cat-result";
    }
}

