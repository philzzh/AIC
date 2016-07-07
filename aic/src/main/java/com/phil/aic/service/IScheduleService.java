package com.phil.aic.service;

import java.util.List;

import com.phil.aic.bean.Schedule;

public interface IScheduleService {
	
	public List<Schedule> getSchedule(String receiver);
}