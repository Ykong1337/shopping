package com.mall.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.entity.Log;
import com.mall.entity.Oplog;
import com.mall.mapper.OplogMapper;
import com.mall.service.OplogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.vo.DataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志表 服务实现类
 * </p>
 *
 * @author Gee
 * @since 2021-04-25
 */
@Service
public class OplogServiceImpl extends ServiceImpl<OplogMapper, Oplog> implements OplogService {
    @Autowired
    private OplogMapper oplogMapper;
    @Override
    public DataVo<Oplog> selectList(Integer page, Integer limit) {
        DataVo dataVo = new DataVo();
        dataVo.setCode(0);
        dataVo.setMsg("");
        IPage<Oplog> iPage = new Page<>(page, limit);
        final IPage<Oplog> iPage1 = oplogMapper.selectPage(iPage, null);
        dataVo.setData(iPage1.getRecords());
        dataVo.setCount((int) iPage1.getTotal());
        return dataVo;
    }

    @Override
    public void add(Oplog oplog) {
        oplogMapper.insert(oplog);
    }

    @Override
    public void del(Integer id) {
        oplogMapper.deleteById(id);
    }
}
