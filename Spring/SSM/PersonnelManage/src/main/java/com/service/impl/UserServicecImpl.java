package com.service.impl;

import com.dao.UserMapper;
import com.service.UserService;
import com.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServicecImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Override
    public User login(String username, String password) {
        User user = new User();
        user = userMapper.findUser(username,password);
        return user;
    }
}
