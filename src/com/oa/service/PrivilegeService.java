package com.oa.service;

import java.util.List;

import com.oa.pojo.Privilege;

public interface PrivilegeService {

	//保存
	void save(Privilege privilege);
	//删除
	void delete(Long id);
	//更新
	void update(Privilege privilege);
	//通过id获取对象
	Privilege getById(Long id);
	//获取多个对象
	List<Privilege> getByIds(Long[] ids);
	//获取全部
	List<Privilege> findAll();
	//查询所有顶级权限的集合
	List<Privilege> findTopList();
	//查询所有权限URL的集合（不能有null，不能重复）
	List<String> getAllPrivilegeUrls();

}
