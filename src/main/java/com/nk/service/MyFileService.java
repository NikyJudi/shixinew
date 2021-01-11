package com.nk.service;

import com.nk.entity.Myfile;
import com.nk.entity.SearchUtilEntity;
import com.nk.util.Msg;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * author: ningkun
 * date: 2021/01/05
 */
public interface MyFileService {
    int deleteByPrimaryKey(Long id);

    int insert(Myfile record);

    Myfile selectByPrimaryKey(Long id);

    List<Myfile> selectAll();

    int updateByPrimaryKey(Myfile record);

    List<Myfile> selectByFunId(Long id);

    Msg updateDeleteStatus(Long id, Long jobid);

    List<Myfile> selectAllGarbage(Long jobid);

    Msg recover(Long id);

    @Transactional
    Msg deleteByFunId(Long jobid);

    Msg recover2(Long jobid);
//
//    List<Myfile> selectByKey(String key);
//
//    List<Myfile> selectByKey2(SearchUtilEntity searchUtilEntity);
}
