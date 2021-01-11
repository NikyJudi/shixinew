package com.nk.dao;


import com.nk.entity.Functionary;
import com.nk.entity.FunctionaryExample;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * author: ningkun
 * date: 2021/01/
 * 用户mapper
 */
@Mapper
public interface FunctionaryMapper {
    long countByExample(FunctionaryExample example);

    int deleteByExample(FunctionaryExample example);

    int deleteByPrimaryKey(Integer jobId);

    int insert(Functionary record);

    int insertSelective(Functionary record);

    List<Functionary> selectByExample(FunctionaryExample example);

    Functionary selectByPrimaryKey(Integer jobId);
    
    List<Functionary> selectByExampleWithDepart(FunctionaryExample example);

    Functionary selectByPrimaryKeyWithDepart(Integer jobId);

    int updateByExampleSelective(@Param("record") Functionary record, @Param("example") FunctionaryExample example);

    int updateByExample(@Param("record") Functionary record, @Param("example") FunctionaryExample example);

    int updateByPrimaryKeySelective(Functionary record);

    int updateByPrimaryKey(Functionary record);

    Functionary login(Integer jobId, String password);
}