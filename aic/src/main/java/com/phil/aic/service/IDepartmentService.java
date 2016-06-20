package com.phil.aic.service;

import java.util.HashMap;
import java.util.List;

import com.phil.aic.bean.Department;

public interface IDepartmentService {
	
	public Department getDepartmentById(int deptId);
	
	public List<Department> getDepartmentUser();
	
	public int insertDepartment(Department department);
	
	public int deleteDepartment(Department department);
	
	public int updateDepartment(Department department);
	
	public List<Department> getDepartment();
}