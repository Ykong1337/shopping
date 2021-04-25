package com.mall.service;

import com.mall.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.vo.DataVo;
import com.mall.vo.UserVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Gee
 * @since 2021-01-06
 */
public interface UserService extends IService<User> {

    /**
     * 查询所有用户
     */
    public DataVo<UserVo> selectAll(Integer page,Integer limit);

    public UserVo selectById(Long id);

    public User select(String uname, String password);

    public User selectByUserId(Long id);

    public void add(User user);

    public void deleteById(Long id);

    public void updateUser(User user);

}
