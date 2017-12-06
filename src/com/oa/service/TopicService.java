package com.oa.service;

import java.util.List;

import com.oa.pojo.Forum;
import com.oa.pojo.Topic;
import com.oa.util.PageInfo;

public interface TopicService {
	
	List<Topic> findByForum(Forum forum);
	void save(Topic topic);
	Topic getById(Long id);
	void update(Topic topic);
	void delete(Long id);
	List<Topic> findByForum(Forum forum, PageInfo pageInfo);
	int getCount(Forum forum);
}
