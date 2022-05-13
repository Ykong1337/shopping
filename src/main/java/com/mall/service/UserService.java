package com.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.entity.User;
import com.mall.vo.DataVo;
import com.mall.vo.UserVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Ykong
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

    int selectCount(String uname);

}
