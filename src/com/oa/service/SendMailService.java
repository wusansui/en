package com.oa.service;

import java.util.List;

import com.oa.pojo.MyMail;

public interface SendMailService {

	List<MyMail> findAll();
	void save(MyMail myMail);
}
