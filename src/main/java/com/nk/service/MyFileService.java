package com.nk.service;

import com.nk.entity.Myfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface MyFileService {
    int deleteByPrimaryKey(Long id);

    int insert(Myfile record);

    Myfile selectByPrimaryKey(Long id);

    List<Myfile> selectAll();

    int updateByPrimaryKey(Myfile record);

    List<Myfile> selectByFunId(Integer id);
}
