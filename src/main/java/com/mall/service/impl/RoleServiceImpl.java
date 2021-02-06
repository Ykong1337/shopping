package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.entity.Role;
import com.mall.mapper.RoleMapper;
import com.mall.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-01-17
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> select() {
        final List<Role> roles = roleMapper.selectList(null);
        return roles;
    }

    @Override
    public Long selectIdByName(String roleName) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("role_name", roleName);
        final Role one = roleMapper.selectOne(wrapper);

        return one.getId();
    }
}
