package com.oa.service;

import java.util.List;

import com.oa.pojo.Department;
import com.oa.pojo.User;

public interface DepartmentService {

	// 保存
	void save(Department department);

	// 删除
	void delete(Long id);

	// 更新
	void update(Department department);

	// 通过id获取对象
	Department getById(Long id);

	// 获取多个对象
	List<Department> getByIds(Long[] ids);

	// 获取全部
	List<Department> findAll();


	Department findByName(String name);

	List<Department> findList();


	List<User> findManagerAll();

}
