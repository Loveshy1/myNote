package com.controller;

import com.domain.Department;
import com.domain.Employee;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/in_emp")
    public String getInEmp(){
        return "in_emp";
    }

    @RequestMapping("/out_emp")
    public String getOutEmp(){
        return "out_emp";
    }

    @RequestMapping("/getInEmp")
    @ResponseBody
    public List<Employee> getInEmpList(Employee employee){
        return employeeService.findInEmp(employee);
    }

    @RequestMapping("/getOutEmp")
    @ResponseBody
    public List<Employee> getOutEmpList(Employee employee){
        return employeeService.findOutEmp(employee);
    }

    @RequestMapping("/getOneEmp")
    @ResponseBody
    public List<Employee> getOneEmp(Employee employee){
        return employeeService.findOneEmp(employee);
    }

    @RequestMapping("/delEmp")
    @ResponseBody
    public List<String> delEmp(Employee employee){
        List<String> rest = new ArrayList<String>();
        int i = employeeService.deleteInEmp(employee);
        if(i>0){
            rest.add("success");
        }
        return rest;
    }

    @RequestMapping("/add")
    @ResponseBody
    public List<String> addEmp(Employee employee){
        List<String> rest = new ArrayList<String>();
        int i = employeeService.addInEmp(employee);
        if(i>0){
            rest.add("success");
        }
        return rest;
    }

    @RequestMapping("/update")
    @ResponseBody
    public List<String> updateEmp(Employee employee){
        System.out.println(employee);
        List<String> rest = new ArrayList<String>();
        int i = employeeService.updateEmp(employee);
        if(i>0){
            rest.add("success");
        }
        return rest;
    }

}
