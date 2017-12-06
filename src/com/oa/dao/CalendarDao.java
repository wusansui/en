package com.oa.dao;

import com.oa.pojo.Calendar;

public interface CalendarDao extends BaseDao<Calendar> {

	boolean add(Calendar calendar);

	boolean edit(Calendar calendar);

	boolean delete(Integer id);

	Calendar getById(Integer id);

}
