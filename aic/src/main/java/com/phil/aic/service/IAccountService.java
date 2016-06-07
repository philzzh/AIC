package com.phil.aic.service;

import com.phil.aic.bean.Account;

public interface IAccountService {
	
//	public String match(Account account);
	public Account getAccountByAccountId(String accountId);
	public int updateAccountByPrimaryKeySelective(Account account);
}