package com.oa.dao;

import java.util.List;

import com.oa.pojo.User;
import com.oa.util.PageInfo;

public interface UserDao extends BaseDao<User> {

	//根据条件分页查询
	List<User> getUsersByPage(PageInfo pageInfo, String name, int age1, int age2);
	//查询所有数据
	List<User> getAllQuery(String name, int age1, int age2);
	//用户登录
	User login(String loginName, String password);
	//根据登录名查询用户
	User findByName(String loginName);
}
