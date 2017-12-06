package com.oa.dao.impl;

import java.util.List;

import com.oa.dao.DepartmentDao;
import com.oa.pojo.Department;
import com.oa.pojo.User;

public class DepartmentDaoImpl extends BaseDaoImpl<Department> implements DepartmentDao {



	@Override
	public Department findByName(String name) {
		return (Department) getSession().createQuery(//
				"from Department d where d.name=?")//
				.setParameter(0, name)//
				.uniqueResult();
	}

	@Override
	public List<User> findManagerAll() {
		//查出身份为经理的员工
		return getSession().createQuery("from User u left join fetch u.roles r where r.name=?")
				.setParameter(0,"部门经理").list();
	}

}
