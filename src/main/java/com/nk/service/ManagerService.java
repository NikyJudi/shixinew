package com.nk.service;

import com.nk.entity.Manager;

import java.util.List;
/**
 * author: ningkun
 * date: 2021/01/05
 */
public interface ManagerService {
    int deleteByPrimaryKey(Long id);

    int insert(Manager record);

    Manager selectByPrimaryKey(Long id);

    List<Manager> selectAll();

    int updateByPrimaryKey(Manager record);
}
