package com.nk.dao;

import com.nk.entity.Myfile;
import com.nk.entity.SearchUtilEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
/**
 * author: ningkun
 * date: 2021/01/05
 * 文件mapper
 */
@Mapper
public interface MyfileMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Myfile record);

    Myfile selectByPrimaryKey(Long id);

    List<Myfile> selectAll();

    int updateByPrimaryKey(Myfile record);

    List<Myfile> selectByFunId(Long id);

    List<Myfile> selectByKey(String key);

    List<Myfile> selectByKey2(SearchUtilEntity searchUtilEntity);


    void updateDeleteStatus(Long id);

    List<Myfile> selectAllGarbage(Long jobid);

    void recover(Long id);

    List<Myfile> selectByFunId2(Long jobid);

    void recover2(Long jobid);
}