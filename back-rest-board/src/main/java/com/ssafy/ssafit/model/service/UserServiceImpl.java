package com.ssafy.ssafit.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.UserDao;
import com.ssafy.ssafit.model.dto.User;

@Service
public class UserServiceImpl implements UserService{
	
	// 필드에 의존성 주입
	@Autowired
	private UserDao userDao;

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return user;
	}

	@Override
	public void logout(User user) {
		// TODO Auto-generated method stub
	}

	@Override
	public int signup(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public User getUser(int no) {
		return userDao.selectOne(no);
	}

	@Override
	public List<User> getUserList() {
		return userDao.selectAll();
	}

	@Override
	public int modifyUser(User user) {
		return userDao.updateUser(user);
	}
	
	@Override
	public int getExp(int no, int add) {
		return userDao.updateExp(no, add);
	}

	@Override
	public int withdraw(int no) {
		return userDao.deleteUser(no);
	}

	@Override
	public List<User> getFollowList(HashMap<String, String> params) {
		return userDao.selectFollowList(params);
	}

}
