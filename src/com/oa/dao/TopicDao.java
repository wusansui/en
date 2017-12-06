package com.oa.dao;

import java.util.List;

import com.oa.pojo.Forum;
import com.oa.pojo.Topic;
import com.oa.util.PageInfo;

public interface TopicDao extends BaseDao<Topic>{
	
	//根据指定版块获得主题集合
	List<Topic> findByForum(Forum forum);
	//根据指定版块获得主题集合,分页
	List<Topic> findByForum(Forum forum,PageInfo pageInfo);
}
