package com.phil.aic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
			s.print("0");//是
			return null;
		}
		else if(!account_.getPassword().equals(account.getPassword())){
			s.print("1");//�������
			return null;
		}
		else {
			model.addAttribute("account", account_);
			s.print("2");
			return null;
		}
	}
	@RequestMapping("/logout")
	public String logout(Model model,HttpSession session) {
		
		model.asMap().remove("account");
		session.invalidate();
		return "redirect:/";	
	}
	@RequestMapping(value = "/toUpdatePwd")
	public String toUpdatePwd(){
			return "passwordUpdate";
	}
	@RequestMapping("/updatePwd")
	public String updatePwd(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter s = response.getWriter();
		Account account = (Account) model.asMap().get("account");
//		Account account_ = new Account();
		if(account.getPassword().equals(request.getParameter("password"))){
			account.setPassword(request.getParameter("npassword"));
			int result = this.accountService.updateAccountByPrimaryKeySelective(account);
			model.addAttribute(account);
			s.print(result);
		}
		else {
			s.print(-1);
		}
		return null;	
	}
}