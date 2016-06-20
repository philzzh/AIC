package com.phil.aic.dao;

import java.util.List;

import com.phil.aic.bean.Account;

public interface AccountMapper {
    int deleteAccountByPrimaryKey(String accountId);

    int insertAccount(Account account);

    int insertSelectiveAccount(Account account);

    Account selectAccountByPrimaryKey(String accountId);

    int updateAccountByPrimaryKeySelective(Account account);

    int updateByPrimaryKey(Account account);
    
    List<Account> selectAccountsByDeptId(int deptId);
}