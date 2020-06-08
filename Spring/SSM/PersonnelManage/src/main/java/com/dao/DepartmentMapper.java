package com.dao;

import com.domain.Department;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DepartmentMapper {
    //按条件查询部门
    public List<Department> findDep(Department department);

    //添加部门信息
    public int addDep(Department department);

    //修改部门信息
    public int updateDep(Department department);

    //删除部门信息
    public int deleteDep(int id);
}
