package com.oa.action;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.apache.struts2.ServletActionContext;

import com.oa.pojo.LeaveBill;
import com.oa.pojo.User;
import com.oa.service.LeaveApplyService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LeaveApplyAction extends ActionSupport implements
		ModelDriven<LeaveBill> {

	private ProcessEngine processEngine;
	private LeaveApplyService leaveApplyService;
	private LeaveBill leaveBill = new LeaveBill();
	private String processInstanceId;
	private String assignee;
	//选择申请条目
	private String selectId;
	//批注
	private String manageNote;
	//总经理审批
	public String topManageNote;
	//显示流程图片时所用的pdid
	private String procDefId;

	// 部署请假流程图
	public void deploy() {
		processEngine.getRepositoryService().createDeployment()
				.addClasspathResource("LeaveBill.bpmn")
				.addClasspathResource("LeaveBill.png").deploy();
	}

	// 启动流程实例 一个businessKey只能启动一次流程实例
	// startProcessInstanceByKey(pdkey,业务键,变量请假人)
	public String startPI() {
		User u = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("userId", u.getLoginName());

		String businessKey = "LeaveBill." + leaveBill.getId();
		// String businessKey="LeaveBill.2";

		ProcessInstance pi=processEngine.getRuntimeService().startProcessInstanceByKey(
				"LeaveBill", businessKey, variables);

		// 请假
		Task task = processEngine.getTaskService().createTaskQuery()
				.taskAssignee(u.getLoginName())
				.processInstanceId(pi.getProcessInstanceId())
				.singleResult();

		processEngine.getTaskService().complete(task.getId());
		//改变请假状态为1
		leaveBill=leaveApplyService.getById(leaveBill.getId());
		leaveBill.setState(1);
		leaveApplyService.update(leaveBill);

		return applyList();
	}
	
	public String apply(){
		return "select";
	}
	
	//选择申请的条目    如请假
	public String select(){
		switch (selectId) {
		case "1":
			return "add";
		case "2":
			return "add2";
		default:
			break;
		}
		return null;
	}
	
	// 查询待办任务列表
	public String taskList() {
		
		User u = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		
		List<Task> taskList = processEngine.getTaskService().createTaskQuery()
					.taskAssignee(u.getLoginName()).list();
	
		
		ActionContext.getContext().put("taskList", taskList);
		return "taskList";
	}

	//查看审核记录
	public String getComment(){
		List<Comment> comments = new ArrayList<Comment>();
		String businessKey = "LeaveBill."+leaveBill.getId();
		//根据businessKey查找正在执行的或者已经完成的流程实例 
		HistoricProcessInstance historicProcessInstance = this.processEngine.getHistoryService()
		.createHistoricProcessInstanceQuery()
		.processInstanceBusinessKey(businessKey)
		.singleResult();
		
		/**
		 * 根据历史的piid得到该流程实例下的所有的历史的节点实例 
		 */
		List<HistoricActivityInstance> activityInstances = this.processEngine.getHistoryService()
		.createHistoricActivityInstanceQuery()
		.processInstanceId(historicProcessInstance.getId())
		.list();
		
		for (HistoricActivityInstance historicActivityInstance : activityInstances) {
			/**
			 * 可以根据HistoricActivityInstance直接得到taskId
			 */
			List<Comment> comments2 = this.processEngine.getTaskService().getTaskComments(historicActivityInstance.getTaskId()) ;
			comments.addAll(comments2);
		}
		ActionContext.getContext().put("comment1",comments.get(0));
		ActionContext.getContext().put("comment2",comments.get(1));
		return "comments";
	}
	
	//先获取请假单,在审批时进行数据回显
	public String getLeaveBill(){
		ProcessInstance pi=processEngine.getRuntimeService().createProcessInstanceQuery()
			.processInstanceId(processInstanceId).singleResult();
		
		String businessKey=pi.getBusinessKey();
		Long leaveBillId=Long.parseLong(businessKey.substring(10));
		LeaveBill leaveBill=leaveApplyService.getById(leaveBillId);
		ActionContext.getContext().put("leaveBill",leaveBill
				);
		ActionContext.getContext().put("processInstanceId",processInstanceId);
		ActionContext.getContext().put("assignee",assignee);
		
		if("admin".equals(assignee)){  //从历史表中获得部门经理的批注
			List<Comment> comments = new ArrayList<Comment>();
			HistoricProcessInstance historicProcessInstance = this.processEngine.getHistoryService()
					.createHistoricProcessInstanceQuery()
					.processInstanceBusinessKey(businessKey)
					.singleResult();
					
					List<HistoricActivityInstance> activityInstances = this.processEngine.getHistoryService()
					.createHistoricActivityInstanceQuery()
					.processInstanceId(historicProcessInstance.getId())
					.list();
					
					for (HistoricActivityInstance historicActivityInstance : activityInstances) {
						List<Comment> comments2 = this.processEngine.getTaskService().getTaskComments(historicActivityInstance.getTaskId()) ;
						comments.addAll(comments2);
					}
					ActionContext.getContext().put("manageNote",comments.get(0));
			return "leaveBill2";
		}else{
			return "leaveBill";
		}
	}
	
	// 完成任务
	public String completeTask() {
		Task task = processEngine.getTaskService().createTaskQuery()
				.taskAssignee(assignee)
				.processInstanceId(processInstanceId)
				.singleResult();

		// 根据task得到pi
		

		ProcessInstance processInstance = processEngine.getRuntimeService()
				.createProcessInstanceQuery()
				.processInstanceId(task.getProcessInstanceId()).singleResult();
		if("admin".equals(assignee)){
			// 把批注添加到act_hi_comment表中
			processEngine.getTaskService().addComment(task.getId(),
					processInstance.getId(), topManageNote);
			//任务完成,更新leaveBill的状态
			ProcessInstance pi=processEngine.getRuntimeService().createProcessInstanceQuery()
					.processInstanceId(processInstanceId).singleResult();
				
		    String businessKey=pi.getBusinessKey();
			Long leaveBillId=Long.parseLong(businessKey.substring(10));
			LeaveBill lBill=leaveApplyService.getById(leaveBillId);
			lBill.setState(2);
			leaveApplyService.update(lBill);
			
		}else{
			
			// 把批注添加到act_hi_comment表中
			processEngine.getTaskService().addComment(task.getId(),
					processInstance.getId(), manageNote);
		}
		processEngine.getTaskService().complete(task.getId());
		return hisTaskList();
	}

	public String hisTaskList(){
		User u = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		List<Task> allTaskList=processEngine.getTaskService()
				.createNativeTaskQuery()
				.sql("SELECT * FROM act_hi_taskinst  WHERE assignee_= #{assignee}")
				 .parameter("assignee", u.getLoginName())
				// .parameter("key", "usertask1")
				 .list();
		ActionContext.getContext().put("allTaskList", allTaskList);

		return "allTaskList";
	}
	

	// 保存请假单
	public String save() {
		User u = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		leaveBill.setUser(u);
		leaveApplyService.save(leaveBill);
		return applyList();
	}

	public String edit() {
		LeaveBill bill = leaveApplyService.getById(leaveBill.getId());
		ActionContext.getContext().getValueStack().push(bill);
		return "edit";
	}

	public String update() {
		User u = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("user");
		leaveBill.setUser(u);
		leaveApplyService.update(leaveBill);
		return applyList();
	}

	public String delete() {
		leaveApplyService.delete(leaveBill.getId());
		return applyList();
	}

	// 显示请假单
	public String applyList() {
		List<LeaveBill> list = leaveApplyService.findAll();
		ActionContext.getContext().put("list", list);
		return "applyList";
	}

	/*  根据业务键获取流程实例和任务
	 * ProcessInstance processInstance = runtimeService
	.createProcessInstanceQuery()
	.processInstanceBusinessKey("LeaveBill.1").singleResult();
	Task task = taskService.createTaskQuery()
	.processInstanceBusinessKey("LeaveBill.1")
	.singleResult();
	*/
	
	//根据businessKey获得pdid
	public String getPDByBusiKey(){
		String businessKey="LeaveBill."+leaveBill.getId();
		Task t=processEngine.getTaskService().createTaskQuery()
				.processInstanceBusinessKey(businessKey)
				.singleResult();
		
	    return t.getProcessDefinitionId();
	}
	
	//根据businessKey获得piid
	public String getPIByBusiKey(){
		String businessKey="LeaveBill."+leaveBill.getId();
		Task t=processEngine.getTaskService()
				.createTaskQuery()
				.processInstanceBusinessKey(businessKey).singleResult();
		
		ProcessDefinition  pd=processEngine.getRepositoryService().createProcessDefinitionQuery()
				.deploymentId(t.getProcessDefinitionId()).singleResult();
		return pd.getDeploymentId();
	}
	
	//显示流程图片
	public String showView(){
		String pdid=getPDByBusiKey();
		String businessKey="LeaveBill."+leaveBill.getId();
		Task t=processEngine.getTaskService()
		.createTaskQuery()
		.processInstanceBusinessKey(businessKey).singleResult();
		
		ProcessInstance pi = processEngine.getRuntimeService()
				.createProcessInstanceQuery()
				.processInstanceId(t.getProcessInstanceId()).singleResult();

		//根据pi得到pdid,在得到processDefinitionEntity
		ProcessDefinitionEntity processDefinitionEntity=(ProcessDefinitionEntity) processEngine
				.getRepositoryService().getProcessDefinition(pi.getProcessDefinitionId());
		ActivityImpl actImpl=processDefinitionEntity.findActivity(pi.getActivityId());

		 ActionContext.getContext().put("coordinateObj", actImpl);  
         ActionContext.getContext().put("procDefId",pdid );  
         return "showImage";  
     }  

	//将流程图片以输入流的形式传到前台
	 public String getProcessPic()  { 
		 
         ProcessDefinition procDef = processEngine.getRepositoryService()
        		 .createProcessDefinitionQuery()
        		 .processDefinitionId(procDefId).singleResult();  
         
         String diagramResourceName = procDef.getDiagramResourceName();  
         InputStream imageStream = processEngine.getRepositoryService().getResourceAsStream(  
                 procDef.getDeploymentId(), diagramResourceName);  
         ServletActionContext.getRequest().setAttribute("inputStream", imageStream);  
         return "pic";  
     }  

	@Override
	public LeaveBill getModel() {
		return leaveBill;
	}

	public ProcessEngine getProcessEngine() {
		return processEngine;
	}

	public void setProcessEngine(ProcessEngine processEngine) {
		this.processEngine = processEngine;
	}

	public LeaveApplyService getLeaveApplyService() {
		return leaveApplyService;
	}

	public void setLeaveApplyService(LeaveApplyService leaveApplyService) {
		this.leaveApplyService = leaveApplyService;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getManageNote() {
		return manageNote;
	}

	public void setManageNote(String manageNote) {
		this.manageNote = manageNote;
	}

	public String getProcDefId() {
		return procDefId;
	}

	public void setProcDefId(String procDefId) {
		this.procDefId = procDefId;
	}

	public void setLeaveBill(LeaveBill leaveBill) {
		this.leaveBill = leaveBill;
	}

	public String getTopManageNote() {
		return topManageNote;
	}

	public void setTopManageNote(String topManageNote) {
		this.topManageNote = topManageNote;
	}

	public String getSelectId() {
		return selectId;
	}

	public void setSelectId(String selectId) {
		this.selectId = selectId;
	}

}
