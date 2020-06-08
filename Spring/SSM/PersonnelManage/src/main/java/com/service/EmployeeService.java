package com.service;

import com.domain.Employee;

import java.util.List;

public interface EmployeeService {

    //按条件查询入职且在职员工
    public List<Employee> findInEmp(Employee employee);


    //按条件查询离职员工
    public List<Employee> findOutEmp(Employee employee);

    //新增入职员工
    public int addInEmp(Employee employee);

    //修改员工信息
    public int updateEmp(Employee employee);

    //离职处理
    public int deleteInEmp(Employee employee);

    //按id获取员工
    public List<Employee> findOneEmp(Employee employee);
}
