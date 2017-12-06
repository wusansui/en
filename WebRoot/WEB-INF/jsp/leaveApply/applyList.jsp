<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'applyList.jsp' starting page</title>
    
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
  
  <body style="margin: 20">
  	<table class="table table-bordered table-hover">
  		<tr>
  			<th>请假人</th>
  			<th>请假天数</th>
  			<th>请假离开时间</th>
  			<th>请假原因</th>
  			<th>状态</th>
  			<th  align="center">操作</th>
  			
  		</tr>
  		<s:iterator value="#list">
  			<tr>
  				<td>${user.loginName }</td>
  				<td>${days }</td>
  				<td><s:date name="%{leaveDate }" format="yyyy-MM-dd"/></td>
  				<td>${content }</td>
  				<td>
  				<s:if test="%{state==0 }">未申请</s:if>
  				<s:elseif test="%{state==1 }">申请中</s:elseif>
  				<s:else>申请完成</s:else>
  				</td>
  				<td><s:if test="%{state==0 }"><s:a action="leaveApply_startPI?id=%{id}">申请</s:a></s:if>
  				<s:if test="%{state==1 }"><s:a action="leaveApply_showView?id=%{id}">查看流程图</s:a></s:if>
  				<s:if test="%{state==2 }"><s:a action="leaveApply_getComment?id=%{id}">查看审批结果</s:a></s:if>
  				<s:if test="%{state==0 }"><s:a action="leaveApply_edit?id=%{id}">修改</s:a></s:if>
  				<s:if test="%{state==0 }"><s:a action="leaveApply_delete?id=%{id}" onclick="return window.confirm('您确定要删除吗?')" >删除</s:a></s:if></td>
  			</tr>
  		</s:iterator>
  	</table>
  
  </body>
</html>
