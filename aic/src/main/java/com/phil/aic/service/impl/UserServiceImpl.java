package com.phil.aic.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phil.aic.bean.User;
import com.phil.aic.dao.IUserDao;
import com.phil.aic.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	

	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

}
