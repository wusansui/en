package com.oa.dao.impl;

import java.util.List;

import com.oa.dao.ForumManageDao;
import com.oa.pojo.Forum;

public class ForumManageDaoImpl extends BaseDaoImpl<Forum> implements ForumManageDao {

	@Override
	public void save(Forum forum) {
		// 保存到数据库,自动生成id
		getSession().save(forum);
		forum.setPosition(forum.getId().intValue());
		// 因为是持久化状态,所以不需要调用update方法
	}
	
	@Override
	public List<Forum> findAll() {
		return getSession().createQuery("from Forum f order by f.position asc").list();
	}

	@Override
	public void moveUp(Long id) {
		// 获取要交换的两个Forum
		Forum forum = getById(id);
		Forum other = (Forum) getSession()//
				.createQuery("from Forum f where f.position<? order by f.position desc")//
				.setParameter(0, forum.getPosition())//
				.setFirstResult(0)//
				.setMaxResults(1)//
				.uniqueResult();
		// 最上面的不能上移
		if (other == null) {
			return;
		}
		// 交换position的值
		int temp = forum.getPosition();
		forum.setPosition(other.getPosition());
		other.setPosition(temp);
		
		// 因为是持久化状态，自动更新到数据库

	}

	@Override
	public void moveDown(Long id) {

		Forum forum = getById(id);
		Forum other = (Forum) getSession()//
				.createQuery("from Forum f where f.position>? order by f.position asc")//
				.setParameter(0, forum.getPosition())//
				.setFirstResult(0)//
				.setMaxResults(1)//
				.uniqueResult();

		if (other == null) {
			return;
		}
		
		int temp=forum.getPosition();
		forum.setPosition(other.getPosition());
		other.setPosition(temp);

	}
}
