package com.mall.service;

import com.mall.entity.Log;
import com.mall.entity.Oplog;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.vo.DataVo;

/**
 * <p>
 * 操作日志表 服务类
 * </p>
 *
 * @author Gee
 * @since 2021-04-25
 */
public interface OplogService extends IService<Oplog> {
    public DataVo<Oplog> selectList(Integer page, Integer limit);

    public void add(Oplog oplog);

    public void del(Integer id);
}
