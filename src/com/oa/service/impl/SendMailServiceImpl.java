package com.oa.service.impl;

import java.util.List;

import com.oa.dao.SendMailDao;
import com.oa.pojo.MyMail;
import com.oa.service.SendMailService;

public class SendMailServiceImpl implements SendMailService
{
	private SendMailDao sendMailDao;

	@Override
	public List<MyMail> findAll() {
		return sendMailDao.findAll();
	}

	@Override
	public void save(MyMail myMail) {
		sendMailDao.save(myMail);
	}

	public SendMailDao getSendMailDao() {
		return sendMailDao;
	}

	public void setSendMailDao(SendMailDao sendMailDao) {
		this.sendMailDao = sendMailDao;
	}
	

}
