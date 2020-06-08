package com.service.impl;

import com.dao.EmployeeMapper;
import com.service.EmployeeService;
import com.domain.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> findInEmp(Employee employee) {
        List<Employee> list = employeeMapper.findInEmp(employee);
        return list;
    }


    @Override
    public List<Employee> findOutEmp(Employee employee) {
        List<Employee> list = employeeMapper.findOutEmp(employee);
        return list;
    }

    @Override
    public int addInEmp(Employee employee) {
        int result=0;
        employee.setIndate(new Date());
        result = employeeMapper.addInEmp(employee);
        return result;
    }

    @Override
    public int updateEmp(Employee employee) {
        int result=0;
        result = employeeMapper.updateEmp(employee);
        return result;
    }

    @Override
    public int deleteInEmp(Employee employee) {
        int result=0;
        employee.setOutdate(new Date());
        result = employeeMapper.deleteInEmp(employee);
        return result;
    }

    @Override
    public List<Employee> findOneEmp(Employee employee){
        return employeeMapper.findOutEmp(employee);
    }
}
