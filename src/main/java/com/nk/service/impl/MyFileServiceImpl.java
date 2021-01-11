package com.nk.service.impl;

import com.nk.dao.MyfileMapper;
import com.nk.entity.Myfile;
import com.nk.entity.SearchUtilEntity;
import com.nk.service.MyFileService;
import com.nk.util.BucketObjectUtil;
import com.nk.util.Msg;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * author: ningkun
 * date: 2021/01/05
 */
@Service
public class MyFileServiceImpl implements MyFileService {
    @Autowired
    private MyfileMapper myfileMapper;

    @Autowired
    private BucketObjectUtil objectUtil;

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

    @Override
    public List<Myfile> selectByFunId(Long id) {
        return myfileMapper.selectByFunId(id);
    }

    @Override
    public Msg updateDeleteStatus(Long id, Long jobid) {
        Myfile myfile = myfileMapper.selectByPrimaryKey(id);
        if (Objects.isNull(myfile) || Long.valueOf(myfile.getFunid()).equals(jobid)) {
            return Msg.fail().add("message", "你无权操作此文件");
        }
        myfileMapper.updateDeleteStatus(id);
        return Msg.success().add("message", "修改成功");
    }

    @Override
    public List<Myfile> selectAllGarbage(Long jobid) {
        return myfileMapper.selectAllGarbage(jobid);
    }

    @Override
    public Msg recover(Long id) {
        myfileMapper.recover(id);
        return Msg.success().add("message","恢复成功");
    }

    @Override
    public Msg deleteByFunId(Long jobid) {
        List<Myfile> myfiles = myfileMapper.selectByFunId2(jobid);
        try {
            for (Myfile myfile:myfiles){
                objectUtil.removeFile(myfile.getFname());
                myfileMapper.deleteByPrimaryKey(myfile.getId());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Msg.success();
    }

    @Override
    public Msg recover2(Long jobid) {
        myfileMapper.recover2(jobid);
        return Msg.success();
    }
//
//    @Override
//    public List<Myfile> selectByKey(String key) {
//        return myfileMapper.selectByKey(key);
//    }
//
//    @Override
//    public List<Myfile> selectByKey2(SearchUtilEntity searchUtilEntity) {
//        return myfileMapper.selectByKey2(searchUtilEntity);
//    }

}
