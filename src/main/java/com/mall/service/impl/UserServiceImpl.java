package com.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.entity.Role;
import com.mall.entity.User;
import com.mall.mapper.RoleMapper;
import com.mall.mapper.UserMapper;
import com.mall.service.UserService;
import com.mall.vo.DataVo;
import com.mall.vo.UserVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Ykong
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public DataVo<UserVo> selectAll(Integer page, Integer limit) {
        DataVo<UserVo> userVoDataVo = new DataVo<>();
        userVoDataVo.setCode(0);
        userVoDataVo.setMsg("");
        IPage<User> Ipage = new Page<>(page, limit);
        final IPage<User> userIPage = userMapper.selectPage(Ipage, null);
        final List<User> users = userIPage.getRecords();
        userVoDataVo.setCount((int) userIPage.getTotal());//给count赋值

        //final List<User> users = userMapper.selectList(null);
        List<UserVo> userVoList = new ArrayList<>();
        for (User user : users) {
            UserVo userVo = new UserVo();
            BeanUtils.copyProperties(user, userVo);//把user的数据赋值给itemVo
            QueryWrapper wrapper = new QueryWrapper();
            wrapper.eq("id", user.getIdentity());
            final Role role = roleMapper.selectOne(wrapper);
            if (role != null) {
                userVo.setIdentity(role.getRoleName());
            }
            userVoList.add(userVo);
        }
        userVoDataVo.setData(userVoList);
        return userVoDataVo;
    }

    @Override
    public UserVo selectById(Long id) {
        UserVo userVo = new UserVo();
        final User user = userMapper.selectById(id);
        BeanUtils.copyProperties(user, userVo);
        final Long identityId = user.getIdentity();
        final Role role = roleMapper.selectById(identityId);
        userVo.setIdentity(role.getRoleName());

        return userVo;
    }

    @Override
    public User select(String uname, String password) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("uname", uname);
        wrapper.eq("password", password);
        return userMapper.selectOne(wrapper);
    }

    @Override
    public User selectByUserId(Long id) {
        final User user = userMapper.selectById(id);
        return user;
    }

    @Override
    @Transactional
    public void add(User user) {
        userMapper.insert(user);
    }

    @Override
    public void deleteById(Long id) {
        userMapper.deleteById(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateById(user);
    }

    @Override
    public int selectCount(String uname) {
        return userMapper.selectCount(uname);
    }

}
