package com.phil.aic.dao;

import java.util.List;

import com.phil.aic.bean.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(String account);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectAccountByPrimaryKey(String account);

    int updateAccountByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
    
    List<Account> selectAccountsByDeptId(int deptId);
}