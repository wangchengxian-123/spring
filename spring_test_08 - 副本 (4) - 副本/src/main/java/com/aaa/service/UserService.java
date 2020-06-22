package com.aaa.service;


import com.aaa.entity.User;

public interface UserService {
    User findByName(String userName);


    int reg(User user);

}
