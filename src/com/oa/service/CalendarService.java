package com.oa.service;

import java.util.List;

import com.oa.pojo.Calendar;

public interface CalendarService {

	boolean add(Calendar calendar);

	boolean edit(Calendar calendar);

	boolean delete(Integer id);

	List<Calendar> findByUser();

	Calendar getById(Integer id);

}
