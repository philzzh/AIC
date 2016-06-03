package com.phil.aic.dao;

import java.util.HashMap;
import java.util.List;

import com.phil.aic.bean.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(int deptId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    List<HashMap> selectDepartmentUser();
}