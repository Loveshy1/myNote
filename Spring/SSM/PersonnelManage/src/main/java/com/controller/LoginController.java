package com.controller;


import com.domain.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping("/index")
    public String getIndex(){
        return "index";
    }

    @RequestMapping("/login")
    @ResponseBody
    public List<String> login(@RequestParam("username")String username, @RequestParam("password")String password, HttpServletRequest request){
        List<String> rest = new ArrayList<String>();
        User login = userService.login(username, password);
        if(login!=null){
            request.getSession().setAttribute("username",login.getUsername());
            rest.add("success");
        }
        return rest;
    }

    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        request.getRequestDispatcher("/index").forward(request,response);
    }
}


