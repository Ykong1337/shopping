package com.mall.mapper;

import com.mall.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Ykong
 *
 */
public interface UserMapper extends BaseMapper<User> {

    @Select("select count(uname) from user where uname = #{arg0}")
    int selectCount(String uname);

}
