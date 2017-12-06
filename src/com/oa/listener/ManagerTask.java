package com.oa.listener;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.apache.struts2.ServletActionContext;

import com.oa.pojo.User;

public class ManagerTask implements TaskListener {

	@Override
	public void notify(DelegateTask delegateTask) {
		
		//根据用户获得其所在部门的经理
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		String managerName=u.getDepartment().getManager().getLoginName();
		delegateTask.setAssignee(managerName);
		
	}
}
