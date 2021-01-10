package com.nk.dao;

import com.nk.entity.Myfile;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyfileMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Myfile record);

    Myfile selectByPrimaryKey(Long id);

    List<Myfile> selectAll();

    int updateByPrimaryKey(Myfile record);

    List<Myfile> selectByFunId(Long id);
}