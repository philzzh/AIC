package com.phil.aic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phil.aic.bean.Case;
import com.phil.aic.dao.CaseMapper;
import com.phil.aic.service.ICaseService;

@Service("caseService")
public class CaseServiceImpl implements ICaseService {
	@Resource
	private CaseMapper caseMapper;

	@Override
	public int insertCase(Case case_) {
		// TODO Auto-generated method stub
		return caseMapper.insertSelective(case_);
	}
	



}
