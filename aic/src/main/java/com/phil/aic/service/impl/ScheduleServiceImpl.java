package com.phil.aic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phil.aic.bean.Schedule;
import com.phil.aic.dao.ScheduleMapper;
import com.phil.aic.service.IScheduleService;

@Service("scheduleService")
public class ScheduleServiceImpl implements IScheduleService {
	@Resource
	private ScheduleMapper scheduleMapper;

	@Override
	public List<Schedule> getSchedule(String receiver) {
		// TODO Auto-generated method stub
		return this.scheduleMapper.selectSchedule(receiver);
	}

	



}
