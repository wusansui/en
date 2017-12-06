package com.oa.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

public class ActivitiTest extends ActivitiContextTest {

	static ProcessEngine processEngine = (ProcessEngine) context
			.getBean("processEngine");

	// 部署请假流程图
	@Test
	public static void deploy() {
		processEngine.getRepositoryService().createDeployment()
				.addClasspathResource("LeaveBill.bpmn")
				.addClasspathResource("LeaveBill.png").deploy();
	}

	// 启动流程实例
	// startProcessInstanceByKey(pdkey,业务键,变量请假人)
	@Test
	public void startPI() {
		//User u = (User) ServletActionContext.getRequest().getSession()
			//	.getAttribute("user");
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("userId","bbb");

		String businessKey = "LeaveBill.2115";
		processEngine.getRuntimeService().startProcessInstanceByKey(
				"LeaveBill", businessKey, variables);
	}
	
	
	//请假
	@Test
	public void finishTask(){
		
		Task task = processEngine.getTaskService()
				.createTaskQuery()
				.taskAssignee("bbb").singleResult();
		
		processEngine.getTaskService()
		.complete(task.getId());
	}
	
	//部门经理审批
	@Test
	public void finishTask2(){
		
		Task task = processEngine.getTaskService()
				.createTaskQuery()
				.taskAssignee("王二麻子的上级").singleResult();
		
		
		 // 根据task得到pi
		 
		ProcessInstance processInstance=processEngine.getRuntimeService()
				.createProcessInstanceQuery()
				.processInstanceId(task.getExecutionId()).singleResult();
		//把批注添加到act_hi_comment表中
		processEngine.getTaskService()
		.addComment(task.getId(), processInstance.getId(), "三蒂的谁说的部门经理批注");
		processEngine.getTaskService()
		.complete(task.getId());
		
	}
	
	@Test
	
	//createTaskQuery  只能查询待完成的任务  不能用sql语句查询
	//createNativeTaskQuery  查询所有的任务  能用sql语句查询
	public void queryTask(){
		List<Task> tasks=processEngine.getTaskService()
				.createTaskQuery()
				.taskAssignee("王二麻子的上级")
				.list();
		for (Task task : tasks) {
			System.out.println(task.getId());
			String a=task.getProcessInstanceId();
			ProcessInstance processInstance=processEngine.getRuntimeService()
					.createProcessInstanceQuery()
					.processInstanceId(task.getProcessInstanceId()).singleResult();
			
			//根据查询出的所有代办任务的id,查询对应的pi,在查询出对应的任务办理人
			Task task2=processEngine.getTaskService()
			.createTaskQuery()
			.processInstanceId(processInstance.getId())
			//.taskDefinitionKey("usertask1")
			//.taskName("提交申请")
			.singleResult();
			System.out.println(task2.getAssignee());
			
			//需要查询完成的任务       and task_def_key_=#{key}
			List<Task> tasks3=processEngine.getTaskService()
					.createNativeTaskQuery()
					 .sql("SELECT * FROM act_hi_taskinst  WHERE proc_inst_id_ = #{taskName} ")
					 .parameter("taskName", processInstance.getId())
					 //.parameter("key", "usertask1")
					 .list();
			for (Task task4 : tasks3) {
				
				System.out.println(task4.getAssignee());
			}
		}
	}
	@Test
	public List<Comment> getComment(Long leaveBillID){
		List<Comment> comments = new ArrayList<Comment>();
		String businessKey = "LeaveBill."+16;
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
		return comments;
	}
	@Test
	public String testGetTask(){
		Task task = processEngine.getTaskService().createTaskQuery().processInstanceId("1022")
				.taskName("提交申请")
				.taskDefinitionKey("usertask1")
				.singleResult();
	
		System.out.println(task.getAssignee());
		return null;
	}
	
	public static void main(String[] args) {
		deploy();
	}
}
