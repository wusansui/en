package com.oa.service.impl;

import java.util.List;

import com.oa.dao.UserDao;
import com.oa.pojo.User;
import com.oa.service.UserService;
import com.oa.util.MD5;
import com.oa.util.PageInfo;

public class UserServiceImpl implements UserService{

	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public void save(User user) {
		//MD5加密
		user.setPassword(MD5.GetMD5Code(user.getPassword()));
		userDao.save(user);
	}

	@Override
	public void delete(Long id) {
		userDao.delete(id);
	}

	@Override
	public void update(User user) {
		user.setPassword(MD5.GetMD5Code(user.getPassword()));
		userDao.update(user);
	}

	@Override
	public User getById(Long id) {
		return userDao.getById(id);
	}

	@Override
	public List<User> getByIds(Long[] ids) {
		return userDao.getByIds(ids);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}
	@Override
	public List<User> getUsersByPage(PageInfo pageInfo, String name, int age1,
			int age2) {
		return userDao.getUsersByPage(pageInfo, name, age1, age2);
	}
	@Override
	public int getAllQuery(String name, int age1, int age2) {
		return userDao.getAllQuery(name, age1, age2).size();
	}
	@Override
	public User login(String loginName, String password) {
		//对密码进行加密
		return userDao.login(loginName, MD5.GetMD5Code(password));
	}
	@Override
	public User findByName(String loginName) {
		return userDao.findByName(loginName);
	}

}
