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
	

	public Account getAccountByAccountId(String accountId) {
		// TODO Auto-generated method stub
		return this.accountMapper.selectAccountByPrimaryKey(accountId);
	}


	/*public String match(Account account) {
		// TODO Auto-generated method stub
		
		Account account_ = this.accountMapper.selectAccountByPrimaryKey(account.getAccountId());
		
	}*/


}
