package com.oa.service;

import java.util.List;
import com.oa.pojo.Forum;

public interface ForumManageService {

	 //保存
	void save(Forum forum);
	//删除
	void delete(Long id);
	//更新
	void update(Forum forum);
	//通过id获取对象
	Forum getById(Long id);
	//获取多个对象
	List<Forum> getByIds(Long[] ids);
	//获取全部
	List<Forum> findAll();
	//上移
	void moveUp(Long id);
	//下移
	void moveDown(Long id);
}
