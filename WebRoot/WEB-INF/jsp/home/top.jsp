<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  <body style="background-color: #3d8fbf">
  	<div align="center">
	    <div style="background: url('images/top.jpg');height:110px;width:932px;float:left;" >
	    <font style="float: right;margin-top: 70 ;margin-right: -240">
	    <!-- 65px 20px 20px 10px -->
	    		欢迎：<strong>${user.loginName }</strong>
	    <a href="user_logout" target="_parent" style="text-decoration: none;">注销</a>
	    </font>
	    </div>
    </div>
		
  </body>
</html>
