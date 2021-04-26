package com.mall.service;

import com.mall.entity.Log;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.vo.DataVo;

/**
 * <p>
 * 登录日志表 服务类
 * </p>
 *
 * @author Gee
 * @since 2021-04-25
 */
public interface LogService extends IService<Log> {
    public DataVo<Log> selectList(Integer page, Integer limit);

    public void add(Log log);

    public void del(Integer id);
}
