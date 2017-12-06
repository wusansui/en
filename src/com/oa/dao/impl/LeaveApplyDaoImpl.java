package com.oa.dao.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.oa.dao.LeaveApplyDao;
import com.oa.pojo.LeaveBill;
import com.oa.pojo.User;

public class LeaveApplyDaoImpl extends BaseDaoImpl<LeaveBill> implements LeaveApplyDao{

	@Override
	public List<LeaveBill> findAll() {
		
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");

		return getSession().createQuery(
				"from " + clazz.getSimpleName() + " where user=?")
				.setParameter(0, u)
				.list();
	}

	
}
