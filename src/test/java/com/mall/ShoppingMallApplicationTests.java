package com.mall;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mall.entity.*;
import com.mall.mapper.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.math.BigDecimal;
import java.util.List;

@SpringBootTest
class ShoppingMallApplicationTests {
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    ItemCatMapper itemCatMapper;
    @Autowired
    OrderShippingMapper orderShippingMapper;
    @Test
    void contextLoads() {
        Item item = new Item();
        item.setCid(5L);
        item.setTitle("红米note 10");
        item.setSellPoint("拍照旗舰");
        item.setPrice(BigDecimal.valueOf(1999.00));
        item.setNum(999);
        item.setLimitNum(100);
        item.setImage(null);
        itemMapper.insert(item);
    }

    @Test
    void test1() {
        User user = new User();

        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("id",1);
        final Role role = roleMapper.selectOne(wrapper);
        final String roleName = role.getRoleName();
        System.out.println(roleName);
        System.out.println(userMapper.selectCount(null));
        List<User> users = userMapper.selectList(null);
        users.forEach(System.out::println);
    }

    @Test
    void test2() {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("name", "手机");
        final ItemCat item = itemCatMapper.selectOne(wrapper);
        System.out.println(item);
        System.out.println(item.getId());
    }

    @Test
    void test3() {
        int res=itemMapper.deleteById(1351227663190773761L);
        System.out.println(res);
    }
    @Test
    void test4() {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.select("id","name");
        final List list = itemCatMapper.selectMaps(wrapper);
        System.out.println("-------查询结果-------");
        list.forEach(System.out::println);
    }

    @Test
    void test5() {
        QueryWrapper<Item> wrapper = new QueryWrapper<>();
        wrapper.like("title","i");
        final List<Item> items = itemMapper.selectList(wrapper);
    }

    @Test
    void test6() {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("user_id", 2);
        final OrderShipping shipping = orderShippingMapper.selectOne(wrapper);
    }

    @Test
    void test7() throws FileNotFoundException {
        //文件上传的地址
        String realPath  = this.getClass().getClassLoader().getResource("static").getFile();

        //用于查看路径是否正确
        System.out.println(realPath);
    }
}
