package com.phil.aic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phil.aic.bean.Case;
import com.phil.aic.bean.Schedule;
import com.phil.aic.service.ICaseService;



@Controller
@RequestMapping("/case")
public class CaseController {
	@Resource
	private ICaseService caseService;
	
	@RequestMapping(value = "/toCaseInit")
	public String toCaseInit(){
			return "caseInit";
	}
	
	@RequestMapping(value = "/sendCase")
	public String sendCase(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter s = response.getWriter();
		int result;
		Case case_ = new Case();
		Schedule schedule = new Schedule();
		case_.setCaseName(request.getParameter("caseName"));
		case_.setCaseType(request.getParameter("caseType"));
		case_.setRemarks(request.getParameter("remarks"));
		schedule.setReciver(request.getParameter("receiver"));
		schedule.setSender(request.getParameter("caseType"));
		result = caseService.insertCaseAndSchedule(case_,schedule);
		
		s.print(result);
		return null;
	}
	
}