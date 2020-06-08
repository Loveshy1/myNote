package com.compoment;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * TODO:
 *
 * @author Gao
 * date: 2020/4/15 11:32
 */
public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("username");
        if (user == null){
            request.getRequestDispatcher("/index").forward(request,response);
            return false;
        }else {
            return true;
        }
    }
}
