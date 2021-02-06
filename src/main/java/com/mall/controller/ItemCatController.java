package com.mall.controller;


import com.mall.entity.ItemCat;
import com.mall.service.ItemCatService;
import com.mall.vo.DataVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 商品类目 前端控制器
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
@Api("分类控制类")
@Controller
public class ItemCatController {
    @Autowired
    private ItemCatService itemCatService;
    @RequestMapping("/toCate")
    public String toCate(){
        return "back/cate";
    }
    @RequestMapping("cate")
    @ResponseBody
    public DataVo<ItemCat> show(Integer page, Integer limit) {
        return itemCatService.show(page, limit);
    }

    @RequestMapping("/addCate")
    @ResponseBody
    public boolean addCate(@RequestBody ItemCat itemCat) {
        itemCatService.add(itemCat);
        return true;
    }
    @RequestMapping("/updateCate")
    @ResponseBody
    public boolean updateCate(@RequestBody ItemCat itemCat) {
        System.out.println(itemCat);
        itemCatService.update(itemCat);
        return true;
    }
    @RequestMapping("delCate")
    @ResponseBody
    public boolean delCate(String ids) {
        System.out.println(ids);
        final List<String> idList = Arrays.asList(ids.split(","));//将字符串转为列表
        for (String id : idList) {
            itemCatService.delById(Long.parseLong(id));
        }
        return true;
    }
    /**
     * 跳转界面
     */
    @RequestMapping("toAddCate")
    public String toAddCate() {

        return "back/cate-add";
    }
    @RequestMapping("toUpdateCate")
    public String toUpdateCate(Long id, Model model) {
        System.out.println(id);
        final ItemCat itemCat = itemCatService.selectById(id);
        model.addAttribute("itemCat", itemCat);
        return "back/cate-view";
    }
}

