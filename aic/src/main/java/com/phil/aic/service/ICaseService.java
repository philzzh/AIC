package com.phil.aic.service;

import org.springframework.transaction.annotation.Transactional;

import com.phil.aic.bean.Case;
import com.phil.aic.bean.Schedule;

public interface ICaseService {
	
	@Transactional(readOnly = false)
	int insertCaseAndSchedule(Case case_,Schedule schedule);
}