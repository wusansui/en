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
    
    <title>My JSP 'list.jsp' starting page</title>
    
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
     			<td>
     				姓名
     			</td>
     			<td>
     				登录时间
     			</td>
     			<td>
     				最后访问时间
     			</td>
     			<td>
     				IP
     			</td>
     			<td>
     				操作
     			</td>
     		</tr>
	<s:iterator value="#list">
		<tr>
			<td>
				${name}
			</td>
			<td>
				${cTime}
			</td>
			<td>
				${lTime}
			</td>
			<td>
				${ip}
			</td>
			<td>
				<s:if test="%{name=='admin'}">管理员</s:if>
				<s:else>
					<s:a action="userManage_kick?id=%{id}">踢出</s:a>
				</s:else>
			</td>
		</tr>
	</s:iterator> 
  	</table>
  </body>
</html>
