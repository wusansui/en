package com.oa.interceptor;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckPrivilegeInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		
		//获取当前访问的url
		String namespace=invocation.getProxy().getNamespace();
		String actionName=invocation.getProxy().getActionName();
		String privilegeUrl=null;
		if(namespace.endsWith("/")){
			privilegeUrl=namespace+actionName;
		}else {
			privilegeUrl=namespace+"/"+actionName;
		}
		
		//要去掉开头的/,对应数据库存储的url地址
		if(privilegeUrl.startsWith("/")){
			privilegeUrl=privilegeUrl.substring(1);
		}
		
		//如果用户未登录
		if(user==null){
			if(privilegeUrl.startsWith("user_login")){
				return invocation.invoke();
			}else{
				return "login";
			}
		}else{
			if(user.hasPrivilegeByUrl(privilegeUrl)){
				return invocation.invoke();
			}else{
				return "noPrivilegeError";
			}
		}
	}

}
