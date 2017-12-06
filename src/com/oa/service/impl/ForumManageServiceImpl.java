package com.oa.service.impl;

import java.util.List;

import com.oa.dao.ForumManageDao;
import com.oa.pojo.Forum;
import com.oa.service.ForumManageService;

public class ForumManageServiceImpl implements ForumManageService{

	private ForumManageDao forumManageDao;
	public void setForumManageDao(ForumManageDao forumManageDao) {
		this.forumManageDao = forumManageDao;
	}
	@Override
	public void save(Forum forum) {
		forumManageDao.save(forum);
	}

	@Override
	public void delete(Long id) {
		forumManageDao.delete(id);
	}

	@Override
	public void update(Forum forum) {
		forumManageDao.update(forum);
	}

	@Override
	public Forum getById(Long id) {
		return forumManageDao.getById(id);
	}

	@Override
	public List<Forum> getByIds(Long[] ids) {
		return forumManageDao.getByIds(ids);
	}

	@Override
	public List<Forum> findAll() {
		return forumManageDao.findAll();
	}

	@Override
	public void moveUp(Long id) {
		forumManageDao.moveUp(id);
	}

	@Override
	public void moveDown(Long id) {
		forumManageDao.moveDown(id);
	}

}
