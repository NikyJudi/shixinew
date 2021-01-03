package com.nk.service.impl;

import com.github.pagehelper.PageHelper;
import com.nk.dao.IUserMapper;
import com.nk.entity.User;
import com.nk.service.IUserService;
import com.nk.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserMapper userMapper;

    @Override
    public Integer regist(User user) {
        // 调用dao实现真正的注册功能
        String md5ofStr = new MD5().getMD5ofStr(user.getPassword());
        user.setPassword(md5ofStr);
        return userMapper.regist(user);
    }

    @Override
    public User login(User user) {
        String md5ofStr = new MD5().getMD5ofStr(user.getPassword());
        user.setPassword(md5ofStr);
        return userMapper.login(user);
    }

    @Override
    public List<User> getAllUsers(Integer pageNum, Integer maxPage) {

        if (pageNum <= 0) {
            pageNum = 1;
        } else if (pageNum >= maxPage) {
            pageNum = maxPage;
        }
        PageHelper.startPage(pageNum, 3);// 只对紧邻（向下）的一条sql起作用
        return userMapper.getAllUsers();
    }

    @Override
    public Integer modifyUserinfoById(User user) {
        String md5ofStr = new MD5().getMD5ofStr(user.getPassword());
        user.setPassword(md5ofStr);
        return userMapper.modifyUserinfoById(user);
    }

    @Override
    public Integer deleteById(Integer id) {
        return userMapper.deleteById(id);
    }
}
