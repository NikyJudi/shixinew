package com.nk.service.impl;

import com.nk.dao.MyfileMapper;
import com.nk.entity.Myfile;
import com.nk.service.MyFileService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyFileServiceImpl implements MyFileService {
    @Autowired
    private MyfileMapper myfileMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return myfileMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Myfile record) {
        return myfileMapper.insert(record);
    }

    @Override
    public Myfile selectByPrimaryKey(Long id) {
        return myfileMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Myfile> selectAll() {
        return myfileMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Myfile record) {
        return myfileMapper.updateByPrimaryKey(record);
    }
}
