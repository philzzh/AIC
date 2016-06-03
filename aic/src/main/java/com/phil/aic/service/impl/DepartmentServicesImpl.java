package com.phil.aic.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phil.aic.bean.Department;
import com.phil.aic.dao.DepartmentMapper;
import com.phil.aic.service.IDepartmentService;
@Service("departmentService")
public class DepartmentServicesImpl implements IDepartmentService {
	
	@Resource
	private DepartmentMapper departmentMapper;

	@Override
	public Department getDepartmentById(int deptId) {
		// TODO Auto-generated method stub
		return departmentMapper.selectByPrimaryKey(deptId);
	}

	@Override
	public List<HashMap> getDepartmentUser() {
		// TODO Auto-generated method stub
		return departmentMapper.selectDepartmentUser();
	}
	
	

}
