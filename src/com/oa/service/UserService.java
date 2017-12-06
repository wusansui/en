package com.oa.service;

import java.util.List;

import com.oa.pojo.User;
import com.oa.util.PageInfo;

public interface UserService {

	User login(String loginName, String password);
	//保存
	void save(User user);
	//删除
	void delete(Long id);
	//更新
	void update(User user);
	//通过id获取对象
	User getById(Long id);
	//获取多个对象
	List<User> getByIds(Long[] ids);
	//获取全部
	List<User> findAll();
	//分页查询
	List<User> getUsersByPage(PageInfo pageInfo,String name,int age1,int age2);
	//根据查询条件显示所有
	int getAllQuery(String name,int age1,int age2);
	//通过登录名查找
	User findByName(String loginName);
}
