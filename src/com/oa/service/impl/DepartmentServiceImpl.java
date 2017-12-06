package com.oa.service.impl;

import java.util.List;

import com.oa.dao.DepartmentDao;
import com.oa.pojo.Department;
import com.oa.pojo.User;
import com.oa.service.DepartmentService;

public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public void save(Department department) {
		departmentDao.save(department);
	}

	@Override
	public void delete(Long id) {
		departmentDao.delete(id);
	}

	@Override
	public void update(Department department) {
		departmentDao.update(department);
	}

	@Override
	public Department getById(Long id) {
		departmentDao.getById(id);
		return departmentDao.getById(id);
	}

	@Override
	public List<Department> getByIds(Long[] ids) {
		return departmentDao.getByIds(ids);
	}

	@Override
	public List<Department> findAll() {
		return departmentDao.findAll();
	}



	@Override
	public Department findByName(String name) {
		return departmentDao.findByName(name);

	}

	@Override
	public List<Department> findList() {
		return departmentDao.findAll();
	}


	@Override
	public List<User> findManagerAll() {
		return departmentDao.findManagerAll();
	}

}
