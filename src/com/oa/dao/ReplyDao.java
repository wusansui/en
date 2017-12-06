package com.oa.dao;

import java.util.List;

import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.util.PageInfo;

public interface ReplyDao extends BaseDao<Reply>{

	//根据主题获取所有回复
	List<Reply> findByTopic(Topic topic);
	//根据主题获取所有回复
	List<Reply> findByTopic(Topic topic,PageInfo pageInfo);
}
