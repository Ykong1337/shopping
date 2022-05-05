package com.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.entity.Role;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Ykong
 *
 */
public interface RoleService extends IService<Role> {
    public List<Role> select();
    public Long selectIdByName(String roleName);
}
