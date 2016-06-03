package com.phil.aic.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phil.aic.bean.User;
import com.phil.aic.service.IDepartmentService;

@Controller
@RequestMapping("/dept")
public class DepartmentController {
	@Resource
	private IDepartmentService depertmentService;
	
	@RequestMapping("/getDeptUser")
	public String getDeptUser(HttpServletRequest request,Model model){
//		int userId = 1;//Integer.parseInt(request.getParameter("id"));
		List<HashMap> deptUser = this.depertmentService.getDepartmentUser();
//		model.addAttribute("user", user);
		return "departmentUser";
	}
}
