package com.oa.dao.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.oa.dao.SendMailDao;
import com.oa.pojo.MyMail;
import com.oa.pojo.User;

public class SendMailDaoImpl extends BaseDaoImpl<MyMail> implements SendMailDao{

	@Override
	public List<MyMail> findAll() {
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");

		return getSession().createQuery(
				"from " + clazz.getSimpleName() + " where user=? order by date")
				.setParameter(0, u)
				.list();
	}

	
}
