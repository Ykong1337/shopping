package com.mall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.entity.UserRole;
import com.mall.mapper.UserRoleMapper;
import com.mall.service.UserRoleService;

import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户角色 服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-01-17
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {

}
