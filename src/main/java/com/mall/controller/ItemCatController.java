package com.mall.controller;


import com.mall.entity.ItemCat;
import com.mall.entity.Oplog;
import com.mall.entity.User;
import com.mall.service.ItemCatService;
import com.mall.service.OplogService;
import com.mall.vo.DataVo;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 商品类目 前端控制器
 * </p>
 *
 * @author Ykong
 *
 */
@Api("分类控制类")
@Controller
public class ItemCatController {
    @Autowired
    private ItemCatService itemCatService;
    @Autowired
    private OplogService oplogService;

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
    public DataVo addCate(@RequestBody ItemCat itemCat, HttpSession session, HttpServletRequest request) {
        Oplog oplog = new Oplog();
        if (itemCat != null) {
            itemCatService.add(itemCat);
            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("添加分类数据");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
            return DataVo.add();
        }
        return DataVo.empty();
    }
    @RequestMapping("/updateCate")
    @ResponseBody
    public DataVo updateCate(@RequestBody ItemCat itemCat, HttpSession session, HttpServletRequest request) {
        Oplog oplog = new Oplog();
        if (itemCat != null) {
            itemCatService.update(itemCat);
            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("修改分类数据");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
            return DataVo.update();
        }
        return DataVo.empty();
    }
    @RequestMapping("delCate")
    @ResponseBody
    public DataVo delCate(String ids, HttpSession session, HttpServletRequest request) {
        Oplog oplog = new Oplog();
        final List<String> idList = Arrays.asList(ids.split(","));//将字符串转为列表
        for (String id : idList) {
            itemCatService.delById(Long.parseLong(id));
            oplog.setIp(request.getRemoteAddr());
            oplog.setOpUser(((User) session.getAttribute("user")).getUname());
            oplog.setOpEvent("删除ID为"+id+"的分类数据");
            oplog.setOpStatus(1);
            oplogService.add(oplog);
        }
        return DataVo.del();
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

