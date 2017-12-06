package com.oa.service;

import java.util.List;

import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.util.PageInfo;

public interface ReplyService {

	List<Reply> findByTopic(Topic topic);
	void save(Reply reply);
	Reply getById(Long id);
	void update(Reply reply);
	//分页
	List<Reply> findByTopic(Topic topic, PageInfo pageInfo);
	int getCount(Topic topic);
}
