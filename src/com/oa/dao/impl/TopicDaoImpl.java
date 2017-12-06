package com.oa.dao.impl;

import java.util.List;

import com.oa.dao.ReplyDao;
import com.oa.dao.TopicDao;
import com.oa.pojo.Forum;
import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.util.PageInfo;

public class TopicDaoImpl extends BaseDaoImpl<Topic> implements TopicDao {

	@Override
	public List<Topic> findByForum(Forum forum) {
		// 排序：所有置顶帖都在最上面，然后把最新状态的主题显示到前面(最后发帖或最后回复)
		return getSession()
				.createQuery(//
						"from Topic t where t.forum=? order by (case t.type when 2 then 2 else 0 end) desc,t.lastUpdateTime desc")//
				.setParameter(0, forum).list();
	}

	@Override
	public void save(Topic topic) {

		getSession().save(topic); // 保存
		Reply r=new Reply();
		r.setAuthor(topic.getAuthor());
		r.setContent(topic.getContent());
		r.setIpAddr(topic.getIpAddr());
		r.setPostTime(topic.getPostTime());
		r.setTopic(topic);
		getSession().save(r);

		// 2，维护相关的信息
		Forum forum = topic.getForum();
		// 主题数,每发表一个新主题,版块主题总数加1
		forum.setTopicCount(forum.getTopicCount() + 1);
		// 文章数（主题+回复）
		forum.setArticleCount(forum.getArticleCount() + 1);
		// 最后发表的主题
		forum.setLastTopic(topic);
		// 更新
		getSession().update(forum);
	}

	@Override
	public List<Topic> findByForum(Forum forum, PageInfo pageInfo) {
		return getSession()
				.createQuery(//
						"from Topic t where t.forum=? order by (case t.type when 2 then 2 else 0 end) desc,t.lastUpdateTime desc")//
				.setParameter(0, forum)//
				.setFirstResult(pageInfo.getStart())//
				.setMaxResults(pageInfo.getSize()).list();
	}

	@Override
	public void delete(Long id) {

		Forum forum = getById(id).getForum();
		//删除一个主题时,更新论坛的最后回复的主题
		if (forum.getLastTopic().getId().equals(id)) {
			int size = getSession()
					.createQuery(
							"from Topic t where t.forum=? order by t.postTime desc")
					.setParameter(0, forum)//
					.list().size();
			if(size<2){
				forum.setLastTopic(null);
			}else{
				List<Topic> list = getSession()
						.createQuery(
								"from Topic t where t.forum=? order by t.postTime desc")
								.setParameter(0, forum)//
								.setFirstResult(0)//
								.setMaxResults(2).list();
				Topic t = list.get(1);
				forum.setLastTopic(t);
			}
			
		}
		forum.setTopicCount(forum.getTopicCount() - 1);
		// 文章数（主题+回复）
		int count=getSession()
		.createQuery(
				"from Reply r where r.topic=?")
		.setParameter(0, getById(id)).list().size();
		forum.setArticleCount(forum.getArticleCount() -count);
		super.delete(id);
		getSession()
		.createQuery(
				"delete from Reply r where r.topic=?")
		.setParameter(0, getById(id)).executeUpdate();
		
	}

}
