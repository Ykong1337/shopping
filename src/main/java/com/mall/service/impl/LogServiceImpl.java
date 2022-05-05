package com.mall.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mall.entity.Log;
import com.mall.mapper.LogMapper;
import com.mall.service.LogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mall.vo.DataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 登录日志表 服务实现类
 * </p>
 *
 * @author Ykong
 *
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {
    @Autowired
    private LogMapper logMapper;

    @Override
    public DataVo<Log> selectList(Integer page, Integer limit) {
        DataVo dataVo = new DataVo();
        dataVo.setCode(0);
        dataVo.setMsg("");
        IPage<Log> iPage = new Page<>(page, limit);
        final IPage<Log> iPage1 = logMapper.selectPage(iPage, null);
        dataVo.setData(iPage1.getRecords());
        dataVo.setCount((int) iPage1.getTotal());
        return dataVo;
    }

    @Override
    public void add(Log log) {
        logMapper.insert(log);
    }

    @Override
    public void del(Integer id) {
        logMapper.deleteById(id);
    }
}
