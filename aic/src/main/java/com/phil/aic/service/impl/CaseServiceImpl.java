package com.phil.aic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phil.aic.bean.Case;
import com.phil.aic.bean.Schedule;
import com.phil.aic.dao.CaseMapper;
import com.phil.aic.dao.ScheduleMapper;
import com.phil.aic.service.ICaseService;

@Service("caseService")
public class CaseServiceImpl implements ICaseService {
	@Resource
	private CaseMapper caseMapper;
	@Resource
	private ScheduleMapper scheduleMapper;

	@Override
	public int insertCaseAndSchedule(Case case_,Schedule schedule) {
		// TODO Auto-generated method stub
		int result = caseMapper.insertSelective(case_);
		schedule.setCaseId(case_.getCaseId());
		result = scheduleMapper.insertSelective(schedule);
		
		return result;
	}
	



}
