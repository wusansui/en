package com.oa.dao;

import com.oa.pojo.Forum;

public interface ForumManageDao extends BaseDao<Forum> {

	// 版块上移,最上面不能上移
	void moveUp(Long id);
	// 版块下移,最下面不能下移
	void moveDown(Long id);
}
