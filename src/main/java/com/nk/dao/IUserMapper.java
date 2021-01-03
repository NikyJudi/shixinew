package com.nk.dao;

import com.nk.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface IUserMapper {
    @Insert("insert into users (username,password,sex) values(#{username},#{password},#{sex})")
    public Integer regist(User user);

    @Select("select * from users where username=#{username} and password=#{password}")
    public User login(User user);

    @Select("select * from users")
    public List<User> getAllUsers();

    @Update("update users set password=#{password} where userid=#{userid}")
    public Integer modifyUserinfoById(User user);

    @Delete("DELETE FROM users WHERE userid = #{id}")
    Integer deleteById(Integer id);
}
