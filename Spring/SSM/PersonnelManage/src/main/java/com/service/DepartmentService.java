package com.service;

import com.domain.Department;

import java.util.List;

public interface DepartmentService {
    //按条件查询部门
    public List<Department> findDep(Department department);

    //添加部门信息
    public int addDep(Department department);

    //修改部门信息
    public int updateDep(Department department);

    //删除部门信息
    public int deleteDep(int id);
}
