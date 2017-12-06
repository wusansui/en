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
    
    <title>My JSP 'edit.jsp' starting page</title>
    
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
    <s:form method="post" action="leaveApply_update">
    <s:hidden name="id"></s:hidden>
    	<table class="table table-bordered table-hover">
    		<tr>
    			<td>请假天数</td>
    			<td><s:textfield name="days"></s:textfield></td>
    		</tr>
    		<tr>
    			<td>请假离开时间</td>
    			<td><s:textfield name="leaveDate"></s:textfield></td>
    		</tr>
    		<tr>
    			<td>请假原因</td>
    			<td><s:textarea name="content"></s:textarea></td>
    		</tr>
    		<tr>
    			<td colspan="2"><input type="submit" value="更新" class="btn btn-primary"/></td>
    		</tr>
    	</table>
    </s:form>
  </body>
</html>
