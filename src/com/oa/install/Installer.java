package com.oa.install;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.oa.pojo.Department;
import com.oa.pojo.Privilege;
import com.oa.pojo.Role;
import com.oa.pojo.User;
import com.oa.util.MD5;

public class Installer {

	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void install() {
		Session session = sessionFactory.getCurrentSession();

		// 1.超级管理员
		User user = new User();
		user.setRealName("超级管理员");
		user.setLoginName("admin");
		user.setPassword(MD5.GetMD5Code("admin")); 
		session.save(user); 
		for(int i=0;i<10;i++){
			User u = new User();
			u.setRealName("员工"+i);
			u.setLoginName("aaa"+i);
			u.setPassword(MD5.GetMD5Code("aaa"+i)); 
			session.save(u); 
		}

		// 2.权限数据
		Privilege menu, menu1, menu2, menu3, menu4, menu5;

		menu = new Privilege("系统管理", null, "FUNC20082.gif", null);
		menu1 = new Privilege("岗位管理", "role_list", null, menu);
		menu2 = new Privilege("部门管理", "department_list", null, menu);
		menu3 = new Privilege("用户管理", "user_getUsersByPage?pageInfo.currentPage=1&name=&age1=0&age2=99", null, menu);

		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);

		session.save(new Privilege("岗位列表", "role_list", null, menu1));
		session.save(new Privilege("岗位删除", "role_delete", null, menu1));
		session.save(new Privilege("岗位添加", "role_add", null, menu1));
		session.save(new Privilege("岗位修改", "role_edit", null, menu1));

		session.save(new Privilege("部门列表", "department_list", null, menu2));
		session.save(new Privilege("部门删除", "department_delete", null, menu2));
		session.save(new Privilege("部门添加", "department_add", null, menu2));
		session.save(new Privilege("部门修改", "department_edit", null, menu2));

		session.save(new Privilege("用户列表", "user_getUsersByPage?pageInfo.currentPage=1&name=&age1=0&age2=99", null, menu3));
		session.save(new Privilege("用户删除", "user_delete", null, menu3));
		session.save(new Privilege("用户添加", "user_add", null, menu3));
		session.save(new Privilege("用户修改", "user_edit", null, menu3));
		session.save(new Privilege("用户初始化密码", "user_initPassword", null, menu3));

		// -------------------------

		menu = new Privilege("网上交流", null, "FUNC20064.gif", null);
		menu1 = new Privilege("论坛管理", "forumManage_list", null, menu);
		menu2 = new Privilege("论坛", "forum_list", null, menu);

		session.save(menu);
		session.save(menu1);
		session.save(menu2);

		// -------------------------

		menu = new Privilege("审批流转", null, "FUNC20057.gif", null);
		menu1 = new Privilege("我要申请", "leaveApply_apply", null, menu);
		menu2 = new Privilege("我的申请记录", "leaveApply_applyList", null, menu);
		menu3 = new Privilege("待办任务", "leaveApply_taskList", null, menu);
		menu4 = new Privilege("任务查询", "leaveApply_hisTaskList", null, menu);

		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);
		
		//3.部门数据
		Department d1=new Department("技术部",null);
		Department d2=new Department("市场部",null);
		Department d3=new Department("运营部",null);
		session.save(d1);
		session.save(d2);
		session.save(d3);
		
		//4.岗位数据
		Role r1=new Role("总经理","主持全面工作");
		Role r2=new Role("总监","制定发展规划");
		Role r3=new Role("部门经理","负责部门工作");
		Role r4=new Role("员工","做好本职工作");
		session.save(r1);
		session.save(r2);
		session.save(r3);
		session.save(r4);
		
	}

	public static void main(String[] args) {
		System.out.println("正在执行安装...");

		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext*.xml");
		Installer installer = (Installer) ac.getBean("installer");
		installer.install();

		System.out.println("== 安装完毕 ==");
	}
}
