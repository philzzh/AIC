package com.phil.aic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phil.aic.bean.Account;
import com.phil.aic.bean.User;
import com.phil.aic.dao.AccountMapper;
import com.phil.aic.service.IAccountService;
import com.phil.aic.service.IUserService;

@Service("accountService")
public class AccountServiceImpl implements IAccountService {
	@Resource
	private AccountMapper accountMapper;
	

	public Account getAccountByAccount(String account) {
		// TODO Auto-generated method stub
		return this.accountMapper.selectAccountByPrimaryKey(account);
	}


	public String match(Account account) {
		// TODO Auto-generated method stub
		String msg="";
		Account account_ = this.accountMapper.selectAccountByPrimaryKey(account.getAccount());
		if(account_==null){
			msg = "0";//不存在用户
		}
		else if(!account_.getPassword().equals(account.getPassword())){
			msg = "1";//密码错误
		}
		return msg;
	}


}
