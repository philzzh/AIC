package com.phil.aic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phil.aic.bean.Account;
import com.phil.aic.bean.Department;
import com.phil.aic.service.IDepartmentService;

@Controller
@RequestMapping("/dept")
public class DepartmentController {
	@Resource
	private IDepartmentService depertmentService;
	
	@RequestMapping("/getDeptUser")
	public String getDeptUser(HttpServletRequest request,Model model){
//		int userId = 1;//Integer.parseInt(request.getParameter("id"));
		List<Department> deptUser = this.depertmentService.getDepartmentUser();
//		model.addAttribute("user", user);
		return "departmentUser";
	}
	
	@RequestMapping(value="/getDeptUserJson", method = RequestMethod.GET)  
    public @ResponseBody List<HashMap> getShopInJSON() {  
  
		List<Department> deptUser = this.depertmentService.getDepartmentUser();  
          
        return formatTree(deptUser);  
  
    }  
	
	@RequestMapping("/toDeptPage")
	public String addDept(Department department) throws IOException{
		/*if(department.getDeptId()) {
			
		}*/
		return "departmentEdit";
	}
	
	@RequestMapping("/addDept")
	public String addDept(Department department,HttpServletResponse response) throws IOException{
//		int userId = 1;//Integer.parseInt(request.getParameter("id"));
		PrintWriter s = response.getWriter();
		int result = this.depertmentService.insertDepartment(department);
//		model.addAttribute("user", user);
		s.print(result);
		return null;
	}
	
	@RequestMapping("/deleteDept")
	public String deleteDept(Department department,HttpServletResponse response) throws IOException{
//		int userId = 1;//Integer.parseInt(request.getParameter("id"));
		PrintWriter s = response.getWriter();
		int result = this.depertmentService.deleteDepartment(department);
//		model.addAttribute("user", user);
		s.print(result);
		return null;
	}
	
	@RequestMapping("/updateDept")
	public String updateDept(Department department,HttpServletResponse response) throws IOException{
//		int userId = 1;//Integer.parseInt(request.getParameter("id"));
		PrintWriter s = response.getWriter();
		int result = this.depertmentService.updateDepartment(department);
//		model.addAttribute("user", user);
		s.print(result);
		return null;
	}
	
	private List<HashMap> formatTree(List<Department> deptUser) {

		String ID="id" ; 
	    String PID="pid" ; 
	    String TEXT="text" ; 
	    String ICONCLS="iconCls" ;
	    String STATE="state" ; 
	    String CHECKED="checked" ; 
	    String CHILDREN="children";
	    HashMap root = new HashMap();
	    root.put(ID, 0);
	    root.put(TEXT, "工商行政管理局");
	    List<HashMap> tree = new ArrayList<HashMap>();
	    List<HashMap> subTree = new ArrayList<HashMap>();
	    if (deptUser != null && deptUser.size() > 0) {
	    	 //for (int i = 0; i < deptUser.size(); i++) {
	    	for(Department dept : deptUser) {
	    		HashMap node = new HashMap();
	    		 node.put(ID, dept.getDeptId());
	    		 node.put(TEXT,dept.getDeptName());
	    		 List<Account> accounts = dept.getAccounts();
	    		 if(accounts != null && accounts.size() > 0) {
	    			 List<HashMap> childrens = new ArrayList<HashMap>();
	    			 //for (int j = 0; j < accounts.size(); i++) {
	    			 for(Account account : accounts){
	    	    		 HashMap children = new HashMap();
	    	    		 children.put(ID, account.getAccountId());
	    	    		 children.put(TEXT,account.getAccountName());
	    	    		 //children.put(STATE,"closed");
	    	    		 childrens.add(children);
	    			 }
	    			 node.put(CHILDREN, childrens);
	    		 }
	    		 subTree.add(node);
	    }
	    	 
	}
	    root.put(CHILDREN,subTree);
	    tree.add(root);
	    return tree;
	}
}
