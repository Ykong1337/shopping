package com.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mall.entity.Oplog;
import com.mall.vo.DataVo;

/**
 * <p>
 * 操作日志表 服务类
 * </p>
 *
 * @author Ykong
 *
 */
public interface OplogService extends IService<Oplog> {
    public DataVo<Oplog> selectList(Integer page, Integer limit);

    public void add(Oplog oplog);

    public void del(Integer id);
}
