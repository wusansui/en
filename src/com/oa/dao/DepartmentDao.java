package com.oa.dao;

import java.util.List;

import com.oa.pojo.Department;
import com.oa.pojo.User;

public interface DepartmentDao extends BaseDao<Department> {

	// 根据名称查询部门
	Department findByName(String name);

	List<User> findManagerAll();
}
