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
    
    <title>My JSP 'mailList.jsp' starting page</title>
    
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
    <s:form>
	<table class="table table-bordered table-hover">
		<tr>
			<th>发件时间</th>
			<th>发件箱</th>
			<th>收件箱</th>
			<th>主题</th>
			<th>内容</th>
		</tr>
		<s:iterator value="#mailList">
			<tr>
				<td><s:date name="%{date}" format="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${mailFrom }</td>
				<td>${mailTo }</td>
				<td>${subject }</td>
				<td>${content }</td>
		    </tr>
		</s:iterator>
  	</table>
  </s:form>
  </body>
</html>
