package com.nk.dao;

import com.nk.entity.Manager;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ManagerMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Manager record);

    Manager selectByPrimaryKey(Long id);

    List<Manager> selectAll();

    int updateByPrimaryKey(Manager record);
}