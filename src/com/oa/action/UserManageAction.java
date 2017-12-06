package com.oa.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserManageAction extends ActionSupport{
	
	private String id;

	public String list(){
		//鉴于session问题,登录人数显式可能不准确
		
		Map<String, HttpSession> onLogin = (Map<String, HttpSession>) ServletActionContext.getServletContext()
				.getAttribute("onLogin");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if (onLogin != null) {
			// 转到list<Map<String,Object>>
			// 声明List
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (Entry<String, HttpSession> en : onLogin.entrySet()) {
				Map<String, Object> one = new HashMap<String, Object>();
				one.put("id", en.getKey());
				User u=(User) en.getValue().getAttribute("user");
				one.put("name", u.getLoginName());
				one.put("cTime",
						sdf.format(new Date(en.getValue().getCreationTime())));
				one.put("lTime", sdf.format(new Date(en.getValue()
						.getLastAccessedTime())));
				one.put("ip", en.getValue().getAttribute("ip"));
				list.add(one);
			}
			ActionContext.getContext().put("list",list);
		}
		return "list";
	}
	
	//踢出用户
	public String kick(){
		
		Map<String, HttpSession> map = (Map<String, HttpSession>) ServletActionContext.getServletContext().getAttribute("onLogin");
		System.err.println(">>"+map);
		
		HttpSession session = map.get(id);//
		session.removeAttribute("user");
		
		return list();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
