package com.oa.service.impl;

import java.util.List;

import com.oa.dao.TopicDao;
import com.oa.pojo.Forum;
import com.oa.pojo.Topic;
import com.oa.service.TopicService;
import com.oa.util.PageInfo;

public class TopicServiceImpl implements TopicService{

	private TopicDao topicDao; 
	
	@Override
	public List<Topic> findByForum(Forum forum) {
		return topicDao.findByForum(forum);
	}
	public TopicDao getTopicDao() {
		return topicDao;
	}
	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}
	@Override
	public void save(Topic topic) {
		// 1，设置属性并保存
		// topic.setType(Topic.TYPE_NORMAL); // 默认为“普通”
		// topic.setReplyCount(0); // 默认为0
		// topic.setLastReply(null); // 默认为null
		// 默认为主题的发表时间
		topic.setLastUpdateTime(topic.getPostTime()); 
		topicDao.save(topic);
		
	}
	@Override
	public Topic getById(Long id) {
		return topicDao.getById(id);
	}
	@Override
	public void update(Topic topic) {
		topicDao.update(topic);
	}
	@Override
	public void delete(Long id) {
		topicDao.delete(id);
	}
	@Override
	public List<Topic> findByForum(Forum forum, PageInfo pageInfo) {
		return topicDao.findByForum(forum, pageInfo);
	}
	@Override
	public int getCount(Forum forum) {
		return topicDao.findByForum(forum).size();
	}

}
