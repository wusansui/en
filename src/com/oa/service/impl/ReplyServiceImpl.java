package com.oa.service.impl;

import java.util.List;

import com.oa.dao.ReplyDao;
import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.service.ReplyService;
import com.oa.util.PageInfo;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDao replyDao;
	@Override
	public List<Reply> findByTopic(Topic topic) {
		return replyDao.findByTopic(topic);
	}
	@Override
	public void save(Reply reply) {
		replyDao.save(reply);
	}
	
	public ReplyDao getReplyDao() {
		return replyDao;
	}
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	@Override
	public void update(Reply reply) {
		replyDao.update(reply);
	}
	@Override
	public Reply getById(Long id) {
		return replyDao.getById(id);
	}
	@Override
	public List<Reply> findByTopic(Topic topic, PageInfo pageInfo) {
		return replyDao.findByTopic(topic, pageInfo);
	}
	@Override
	public int getCount(Topic topic) {
		return replyDao.findByTopic(topic).size();
	}

}
