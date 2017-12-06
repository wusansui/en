package com.oa.dao;

import java.util.List;

import com.oa.pojo.Privilege;

public interface PrivilegeDao extends BaseDao<Privilege>{

		//查询所有顶级权限的集合
		List<Privilege> findTopList();
		//查询所有权限URL的集合（不能有null，不能重复）
		List<String> getAllPrivilegeUrls();
}
