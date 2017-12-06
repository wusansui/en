<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="org.activiti.engine.ProcessEngine"%> 
<%@page import="org.activiti.engine.task.Task"%> 
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'allTaskList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="bootstrap/js/jQuery.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>

  </head>
  
  <body style="margin: 20;margin-right: 400">
  	<table class="table table-bordered table-hover">
  		<tr>
  			<th>申请人</th>
  			<th>任务名称</th>
  			<th>办理人</th>
  		</tr>
  		<s:iterator value="#allTaskList">
  			<tr>
  				<td>
  				<%
  				    String a=(String)pageContext.findAttribute("processInstanceId");
  				    ProcessEngine processEngine=(ProcessEngine)WebApplicationContextUtils.getWebApplicationContext(application).getBean("processEngine");
  					Task task = processEngine.getTaskService().createNativeTaskQuery()
  					.sql("SELECT * FROM act_hi_taskinst  WHERE proc_inst_id_= #{processInstanceId} and task_def_key_= #{key}")
				    .parameter("processInstanceId", a)
				    .parameter("key","usertask1")
					.singleResult();
  				    out.write(task.getAssignee());
  				 %>
  				</td>
  				<td>${name }</td>
  				<td>${assignee }</td>
  			</tr>
  		</s:iterator>
  	</table>
  </body>
</html>
