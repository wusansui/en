package com.oa.service;

import java.util.List;

import com.oa.pojo.Role;

public interface RoleService {

	    //保存
		void save(Role role);
		//删除
		void delete(Long id);
		//更新
		void update(Role role);
		//通过id获取对象
		Role getById(Long id);
		//获取多个对象
		List<Role> getByIds(Long[] ids);
		//获取全部
		List<Role> findAll();
}
