package com.oa.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.oa.pojo.Privilege;
import com.oa.service.PrivilegeService;

public class InitServletContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc=sce.getServletContext();
		//得到Service的实例对象
		ApplicationContext ac=  WebApplicationContextUtils.getWebApplicationContext(sc);
		PrivilegeService privilegeService=(PrivilegeService) ac.getBean("privilegeService");
		
		//准备顶级菜单（权限）
		List<Privilege> topPrivilegeList=privilegeService.findTopList();
		sc.setAttribute("topPrivilegeList", topPrivilegeList);
		System.out.println("-- 已准备好顶级权限的数据 --");
		
		// 准备所有权限URL的集合
		List<String> allPrivilegeUrls = privilegeService.getAllPrivilegeUrls();
		sc.setAttribute("allPrivilegeUrls", allPrivilegeUrls);
		System.out.println("-- 已准备好所有权限的URL数据 --");
	}

}
