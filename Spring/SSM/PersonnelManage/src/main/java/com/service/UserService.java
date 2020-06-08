package com.service;

import com.domain.User;

public interface UserService {
    public User login(String username, String password);
}
