package com.phil.aic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phil.aic.bean.Account;
import com.phil.aic.service.IAccountService;



@Controller
@RequestMapping("/account")
public class AccountController {
	@Resource
	private IAccountService accountService;
	
	@RequestMapping(value = "/match",method = {RequestMethod.POST}, consumes = "application/json")
	@ResponseBody
	public String toIndex(@RequestBody Account account,Model model){
		String msg = this.accountService.match(account);
		if(!msg.equals("")){
			model.addAttribute("msg", msg);
			return "login";
		}
		else {
			return "main";
		}
	}
	@RequestMapping("/check1")
	public String test1(Account account){
		String msg = "aa";
		System.out.println(account.toString());
		/*if(!msg.equals("")){
			model.addAttribute("msg", msg);
			return "login";
		}
		else {
			return "main";
		}*/
		return "main";
	}
	
	@RequestMapping("/check")
	public String test(Account account, Model model,HttpServletResponse response) throws IOException{
		PrintWriter s = response.getWriter();
		String msg = this.accountService.match(account);
		if(!msg.equals("")){
			
			s.print(msg);
			return null;
		}
		else {
			msg="2";//验证成功
			model.addAttribute("account", account);
			s.print(msg);
			return null;
		}
	}
}