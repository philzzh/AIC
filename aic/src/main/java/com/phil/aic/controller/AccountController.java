package com.phil.aic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.phil.aic.bean.Account;
import com.phil.aic.service.IAccountService;



@Controller
@SessionAttributes("account")
@RequestMapping("/account")
public class AccountController {
	@Resource
	private IAccountService accountService;
	
	@RequestMapping(value = "/login")
	public String login(){
			return "login";
	}
	
	@RequestMapping(value = "/main")
	public String toMain(Account account,Model model){
			return "main";
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
	public String test(Account account, Model model ,HttpServletResponse response) throws IOException{
		PrintWriter s = response.getWriter();
		Account account_ = this.accountService.getAccountByAccountId(account.getAccountId());
		if(account_==null){
			s.print("0");//不存在用户
			return null;
		}
		else if(!account_.getPassword().equals(account.getPassword())){
			s.print("1");//密码错误
			return null;
		}
		else {
			model.addAttribute("account", account);
			s.print("2");
			return null;
		}
	}
	@RequestMapping("/logout")
	public String logout(Model model,HttpSession session) {
		
		model.asMap().remove("account");
		session.invalidate();
		return "redirect:/login";	
	}
}