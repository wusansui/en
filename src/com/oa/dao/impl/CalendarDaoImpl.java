package com.oa.dao.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.oa.dao.CalendarDao;
import com.oa.pojo.Calendar;
import com.oa.pojo.User;

public class CalendarDaoImpl extends BaseDaoImpl<Calendar> implements
		CalendarDao {

	@Override
	public boolean add(Calendar calendar) {
		boolean flag = false;

		try {
			User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
			calendar.setUser(u);
			getSession().save(calendar);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean edit(Calendar calendar) {
		boolean flag = false;

		try {
			User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
			calendar.setUser(u);
			getSession().update(calendar);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delete(Integer id) {
		boolean flag = false;

		try {
			Calendar c=getById(id);
			getSession().delete(c);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Calendar> findAll() {
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");

		return getSession().createQuery(
				"from " + clazz.getSimpleName() + " where user=?")
				.setParameter(0, u)
				.list();
	}
	@Override
	public Calendar getById(Integer id){
		
		return (Calendar) getSession().get(Calendar.class, id);
		
	}

}
	


