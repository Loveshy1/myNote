package com.controller;

import com.domain.Department;
import com.domain.User;
import com.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dep")
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/maneger")
    public String index(){
        return "dep_maneger";
    }

    @RequestMapping("/getDepList")
    @ResponseBody
    public List<Department> getDep(Department department){
        List<Department> allDep = departmentService.findDep(department);
        return allDep;
    }

    @RequestMapping("/delDep")
    @ResponseBody
    public List<String> delDep(@RequestParam("id")Integer id){
        List<String> rest = new ArrayList<String>();
        int i = departmentService.deleteDep(id);
        if(i>0){
            rest.add("success");
        }
        return rest;
    }

    @RequestMapping("/add")
    @ResponseBody
    public List<String> addDep(Department department){
        System.out.println("1111"+department);
        List<String> rest = new ArrayList<String>();
        int i = departmentService.addDep(department);
        if(i>0){
            rest.add("success");
        }
        return rest;
    }

    @RequestMapping("/update")
    @ResponseBody
    public List<String> updateDep(Department department){
        List<String> rest = new ArrayList<String>();
        int i = departmentService.updateDep(department);
        if(i>0){
            rest.add("success");
        }
        return rest;
    }

    @RequestMapping("/getDep")
    @ResponseBody
    public List<Department> getDepName(){
        return departmentService.findDep(new Department());
    }
}
