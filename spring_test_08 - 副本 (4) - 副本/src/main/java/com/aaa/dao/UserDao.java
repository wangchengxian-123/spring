package com.aaa.dao;


import com.aaa.entity.User;
import org.apache.ibatis.annotations.Select;

public interface UserDao {
    @Select("select * from t_user where username=#{userName}")
    User findByName(String userName);
}
