package com.dao;

import com.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface UserMapper {
    /**
     *
     * @param username
     * @param password
     * @return
     */
    public User findUser(@Param("username")String username, @Param("password") String password);
}
