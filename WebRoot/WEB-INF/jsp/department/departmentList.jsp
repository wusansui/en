<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'departmentList.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	var msg_add1 = '${msg_add1}';
	if (msg_add1 != "") {
		alert(msg_add1);
		window.close();
	}
	var msg_edit1 = '${msg_edit1}';
	if (msg_edit1 != "") {
		alert(msg_edit1);
		window.close();
	}
	var msg_delete = '${msg_delete}';
	if (msg_delete != "") {
		alert(msg_delete);
	}

	//编辑部门
	function edit1(id) {

		var path = "department_editUI1?id=" + id;
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href = "department_list";
	}

	//添加部门
	function add1() {
		var path = "department_addUI1";
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=500px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href = "department_list";
	}

</script>

</head>

<body style="margin: 20">
	<div style="margin-top: 10">
	<span><font size="4">部门管理======>>      </font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span><s:a onclick="add1()" includeParams="department_add">添加部门</s:a></span>
	</div>
	<br>
	<table class="table table-bordered table-hover">
		<tr>
			<th>部门名称</th>
			<th>部门经理</th>
			<th>部门简介</th>
			<s:if test='#session.user.hasPrivilegeByUrl("department_edit")'><th>编辑</th></s:if>
			<s:if test='#session.user.hasPrivilegeByUrl("department_delete")'><th>删除</th></s:if>
		</tr>

		<s:iterator value="#list">
			<tr>
				<td>${name}</td>
				<td>${manager.loginName}&nbsp;</td>
				<td>${note}&nbsp;</td>
				<s:if test='#session.user.hasPrivilegeByUrl("department_edit")'><td>&nbsp;<s:a onclick="edit1('%{id}')" includeParams="department_edit">编辑</s:a></td></s:if>
				<s:if test='#session.user.hasPrivilegeByUrl("department_delete")'><td>&nbsp;<s:a action="department_delete?id=%{id}" onclick="return window.confirm('确定要删除吗?')" >删除</s:a></td></s:if>
			</tr>
		</s:iterator>

	</table>

</body>
</html>
