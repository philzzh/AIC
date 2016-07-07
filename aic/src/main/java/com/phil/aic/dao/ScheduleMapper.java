package com.phil.aic.dao;

import java.util.List;

import com.phil.aic.bean.Schedule;

public interface ScheduleMapper {
    int deleteByPrimaryKey(String scheduleId);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(String scheduleId);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);
    
    List<Schedule> selectSchedule(String receiver);
}