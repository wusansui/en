package com.oa.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.oa.dao.UserDao;
import com.oa.pojo.User;
import com.oa.util.PageInfo;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public List<User> getUsersByPage(PageInfo pageInfo, String name, int age1, int age2) {
		Criteria criteria = (Criteria) getSession().createCriteria(User.class);
		// 根据id升序对员工进行排序
		criteria.addOrder(Order.asc("id"));
		if (name != null && name != "") {
			criteria.add(Restrictions.like("realName", ("%" + name + "%")));
		}
		if (age1 >= 0 && age1 < age2) {
			criteria.add(Restrictions.between("age", age1, age2));
		}
		List<User> b = criteria.setFirstResult(pageInfo.getStart()).setMaxResults(pageInfo.getSize()).list();
		return b;
	}

	@Override
	public List<User> getAllQuery(String name, int age1, int age2) {
		Criteria criteria = (Criteria) getSession().createCriteria(User.class);
		
		//应避免数据库中realName对应列数据为null,会出现匹配不到,但实际需求应匹配
		//realName与age列一定不能为null,前台需要验证
		if (name != null && name != "") {
			criteria.add(Restrictions.like("realName", ("%" + name + "%")));
		}
		//criteria.add(Restrictions.like("realName", ("%" + name + "%")));
		if (age1 >= 0 && age1 < age2) {
			criteria.add(Restrictions.between("age", age1, age2));
		}
		return criteria.list();
	}

	@Override
	public User login(String loginName, String password) {
		User u = (User) getSession().createQuery("from User u where u.loginName=? and u.password=?")
				.setString(0, loginName).setString(1, password).uniqueResult();

		return u;
	}

	@Override
	public User findByName(String loginName) {
		User u = (User) getSession().createQuery("from User u where u.loginName=?")
				.setString(0, loginName).uniqueResult();

		return u;
	}

}
