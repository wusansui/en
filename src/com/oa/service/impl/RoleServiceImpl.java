package com.oa.service.impl;

import java.util.List;

import com.oa.dao.RoleDao;
import com.oa.pojo.Role;
import com.oa.service.RoleService;

public class RoleServiceImpl implements RoleService{

	private RoleDao roleDao;
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
	@Override
	public void save(Role role) {
		roleDao.save(role);
	}

	@Override
	public void delete(Long id) {
		roleDao.delete(id);
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
	}

	@Override
	public Role getById(Long id) {
		return roleDao.getById(id);
	}

	@Override
	public List<Role> getByIds(Long[] ids) {
		return roleDao.getByIds(ids);
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}

}
