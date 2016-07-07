package com.phil.aic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phil.aic.bean.Account;
import com.phil.aic.bean.Schedule;
import com.phil.aic.service.IScheduleService;



@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Resource
	private IScheduleService scheduleService;
	
	@RequestMapping(value = "/getScheduleJson")
	public @ResponseBody List<Schedule> getSchedule(String receiver,HttpServletRequest request) throws IOException{
		String accountId = ((Account) request.getSession().getAttribute("account")).getAccountId();
		//scheduleService.getSchedule();
		List<Schedule> schedule = scheduleService.getSchedule(accountId);
		return schedule;
	}
	
}