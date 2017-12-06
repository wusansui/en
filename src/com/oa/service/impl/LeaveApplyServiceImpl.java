package com.oa.service.impl;

import java.util.List;

import com.oa.dao.LeaveApplyDao;
import com.oa.pojo.LeaveBill;
import com.oa.service.LeaveApplyService;

public class LeaveApplyServiceImpl implements LeaveApplyService{

	private LeaveApplyDao leaveApplyDao;
	@Override
	public void save(LeaveBill leaveBill) {
		leaveApplyDao.save(leaveBill);
	}

	@Override
	public void delete(Long id) {
		leaveApplyDao.delete(id);
	}

	@Override
	public void update(LeaveBill leaveBill) {
		leaveApplyDao.update(leaveBill);
	}

	@Override
	public LeaveBill getById(Long id) {
		return leaveApplyDao.getById(id);
	}

	public LeaveApplyDao getLeaveApplyDao() {
		return leaveApplyDao;
	}

	public void setLeaveApplyDao(LeaveApplyDao leaveApplyDao) {
		this.leaveApplyDao = leaveApplyDao;
	}

	@Override
	public List<LeaveBill> findAll() {
		return leaveApplyDao.findAll();
	}

}
