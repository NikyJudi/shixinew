package com.nk.service.impl;

import com.nk.dao.ManagerMapper;
import com.nk.entity.Manager;
import com.nk.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return managerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Manager record) {
        return managerMapper.insert(record);
    }

    @Override
    public Manager selectByPrimaryKey(Long id) {
        return managerMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Manager> selectAll() {
        return managerMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Manager record) {
        return managerMapper.updateByPrimaryKey(record);
    }
}
