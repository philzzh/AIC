package com.phil.aic.service;

import java.util.HashMap;
import java.util.List;

import com.phil.aic.bean.Department;

public interface IDepartmentService {
	
	public Department getDepartmentById(int deptId);
	
	List<Department> getDepartmentUser();
}