package com.phil.aic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	private List<HashMap> formatTree(List<Department> deptUser) {

		String ID="id" ; 
	    String PID="pid" ; 
	    String TEXT="text" ; 
	    String ICONCLS="iconCls" ;
	    String STATE="state" ; 
	    String CHECKED="checked" ; 
	    String CHILDREN="children";
	    List<HashMap> tree = new ArrayList<HashMap>();
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
	    		 tree.add(node);
	    }
	    	 
	}
	    return tree;
	}
}
