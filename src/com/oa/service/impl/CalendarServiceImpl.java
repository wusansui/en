package com.oa.service.impl;

import java.util.List;

import com.oa.dao.CalendarDao;
import com.oa.pojo.Calendar;
import com.oa.service.CalendarService;

public class CalendarServiceImpl implements CalendarService{

	private CalendarDao calendarDao;

	public CalendarDao getCalendarDao() {
		return calendarDao;
	}

	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
	}

	@Override
	public boolean add(Calendar calendar) {
		
		return calendarDao.add(calendar);
	}

	@Override
	public boolean edit(Calendar calendar) {
		return calendarDao.edit(calendar);
	}

	@Override
	public boolean delete(Integer id) {
		
		return calendarDao.delete(id);
	}

	@Override
	public List<Calendar> findByUser() {
		return calendarDao.findAll();
	}

	@Override
	public Calendar getById(Integer id) {
		return calendarDao.getById(id);
	}
	
}
