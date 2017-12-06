package com.oa.dao;

import java.util.List;

public interface BaseDao<T> {

	//保存
	void save(T entity);
	//删除
	void delete(Long id);
	//更新
	void update(T entity);
	//通过id获取对象
	T getById(Long id);
	//获取多个对象
	List<T> getByIds(Long[] ids);
	//获取全部
	List<T> findAll();
}
