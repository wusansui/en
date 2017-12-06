package com.oa.dao.impl;

import java.util.List;

import com.oa.dao.ReplyDao;
import com.oa.pojo.Forum;
import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.util.PageInfo;

public class ReplyDaoImpl extends BaseDaoImpl<Reply> implements ReplyDao{

	@Override
	public List<Reply> findByTopic(Topic topic) {
		return getSession().createQuery(//
				// 排序：最前面的是最早发表的回帖
				"from Reply r where r.topic=? order by r.postTime asc")//
				.setParameter(0, topic)//
				.list();
	}

	//新增一个回复
	@Override
	public void save(Reply reply) {
		// 保存到DB
		getSession().save(reply);

		// 维护相关的信息
		Topic topic = reply.getTopic();
	
		Forum forum = topic.getForum();

		// 版块的文章数（主题+回复）
		forum.setArticleCount(forum.getArticleCount() + 1); 
		// 主题的回复数
		topic.setReplyCount(topic.getReplyCount() + 1); 
		// 主题的最后发表的回复
		topic.setLastReply(reply);
		// 主题的最后更新的时间（主题的发表时间或是最后回复的时间）
		topic.setLastUpdateTime(reply.getPostTime()); 

		getSession().update(topic);
		getSession().update(forum);
	}

	@Override
	public List<Reply> findByTopic(Topic topic, PageInfo pageInfo) {
		return getSession().createQuery(//
				// 排序：最前面的是最早发表的回帖
				"from Reply r where r.topic=? order by r.postTime asc")//
				.setParameter(0, topic)//
				.setFirstResult(pageInfo.getStart())//
				.setMaxResults(pageInfo.getSize())//
				.list();
	}
	
}
