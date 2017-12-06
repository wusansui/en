package com.oa.dao.impl;

import java.util.List;
import com.oa.dao.PrivilegeDao;
import com.oa.pojo.Privilege;

public class PrivilegeDaoImpl extends BaseDaoImpl<Privilege> implements PrivilegeDao{

	@Override
	public List<Privilege> findTopList() {
		return getSession().createQuery(
				"from Privilege p where p.parent is null")
				.list();
	}

	@Override
	public List<String> getAllPrivilegeUrls() {
		return getSession().createQuery(
				"select distinct p.url from Privilege p where p.url is not null")
				.list();
	}

}
