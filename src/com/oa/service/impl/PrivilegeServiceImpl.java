package com.oa.service.impl;

import java.util.List;

import com.oa.dao.PrivilegeDao;
import com.oa.pojo.Privilege;
import com.oa.service.PrivilegeService;

public class PrivilegeServiceImpl implements PrivilegeService{

	private PrivilegeDao privilegeDao;
	public void setPrivilegeDao(PrivilegeDao privilegeDao) {
		this.privilegeDao = privilegeDao;
	}
	@Override
	public void save(Privilege privilege) {
		privilegeDao.save(privilege);
	}
	

	@Override
	public void delete(Long id) {
		privilegeDao.delete(id);
	}

	@Override
	public void update(Privilege privilege) {
		privilegeDao.update(privilege);
	}

	@Override
	public Privilege getById(Long id) {
		
		return privilegeDao.getById(id);
	}

	@Override
	public List<Privilege> getByIds(Long[] ids) {
		
		return privilegeDao.getByIds(ids);
	}

	@Override
	public List<Privilege> findAll() {
		
		return privilegeDao.findAll();
	}

	@Override
	public List<Privilege> findTopList() {
		
		return privilegeDao.findTopList();
	}

	@Override
	public List<String> getAllPrivilegeUrls() {
		
		return privilegeDao.getAllPrivilegeUrls();
	}

}
