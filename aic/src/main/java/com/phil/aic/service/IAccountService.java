package com.phil.aic.service;

import com.phil.aic.bean.Account;

public interface IAccountService {
	
	public String match(Account account);
	public Account getAccountByAccount(String account);
}