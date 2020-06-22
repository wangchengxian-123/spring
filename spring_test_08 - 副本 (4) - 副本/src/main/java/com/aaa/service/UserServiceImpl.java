package com.aaa.service;

import com.aaa.dao.UserDao;

import com.aaa.entity.User;
import com.aaa.util.EnctypeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User findByName(String userName) {
        return userDao.findByName(userName);
    }

    @Override
    public int reg(User user) {
        String encPassword = EnctypeUtil.encPassword(user.getPassword(), user.getUserName());
        user.setPassword(encPassword);
        //调用mapper中的录入方法
        return 0;
    }
}
