package com.nk.service;

import com.nk.entity.User;

import java.util.List;

public interface IUserService {
    public Integer regist(User user);

    public User login(User user);

    public List<User> getAllUsers(Integer pageNum, Integer maxPage);

    public Integer modifyUserinfoById(User user);

    Integer deleteById(Integer id);
}
