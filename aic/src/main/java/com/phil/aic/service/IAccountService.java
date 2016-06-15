package com.phil.aic.service;

import java.util.List;

import com.phil.aic.bean.Account;

public interface IAccountService {
	
//	public String match(Account account);
	public Account getAccountByAccountId(String accountId);
	public List<Account> getAccountsByDeptId(int deptId);
	public int updateAccountByPrimaryKeySelective(Account account);
	public int deleteAccountByPrimaryKey(String accountId);
	public int insertAccount(Account account);
}