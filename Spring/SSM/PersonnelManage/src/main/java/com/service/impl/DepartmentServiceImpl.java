package com.service.impl;

import com.dao.DepartmentMapper;
import com.service.DepartmentService;
import com.domain.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> findDep(Department department) {
        List<Department> list = departmentMapper.findDep(department);
        return list;
    }

    @Override
    public int addDep(Department department) {
        int result=0;
        if(departmentMapper.findDep(department).size()<1){
            result = departmentMapper.addDep(department);
        }
        return result;
    }

    @Override
    public int updateDep(Department department) {
        int result=0;
        result = departmentMapper.updateDep(department);
        return result;
    }

    @Override
    public int deleteDep(int id) {
        int result=0;
        result = departmentMapper.deleteDep(id);
        return result;
    }
}
