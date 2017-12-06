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

<title>My JSP 'roleList.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jQuery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	var msg_add = '${msg_add}';
	if (msg_add != "") {
		alert(msg_add);
		window.close();
	}
	var msg_edit = '${msg_edit}';
	if (msg_edit != "") {
		alert(msg_edit);
		window.close();
	}
	var msg_delete = '${msg_delete}';
	if (msg_delete != "") {
		alert(msg_delete);
		window.close();
	}
	function add() {
		var path = "role_addUI";
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href = "role_list";
	}

	function edit(id) {

		var path = "role_editUI?id=" + id;
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href = "role_list";
	}

</script>
</head>

<body style="margin: 20">
	<!-- 其他功能超链接 -->
	<div style="margin-top: 10">
	<span><font size="4">岗位管理┈━═☆       </font></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span><s:a onclick="add()" includeParams="role_addUI"><font size="4">添加岗位</font></s:a></span>
	</div>
	<br>
	<table class="table table-bordered table-hover">

		<tr>
			<th>岗位名称</th>
			<th>岗位说明</th>
			<s:if test='#session.user.hasPrivilegeByUrl("role_editUI")'><th>修改</th></s:if>
			<s:if test='#session.user.hasPrivilegeByUrl("role_delete")'><th>删除</th></s:if>
			<s:if test='#session.user.hasPrivilegeByUrl("role_addUI")'><th>设置权限</th></s:if>
		</tr>

		<!--显示数据列表-->
		<s:iterator value="#roleList">
			<tr>
				<td>${name}&nbsp;</td>
				<td>${note}&nbsp;</td>
				<s:if test='#session.user.hasPrivilegeByUrl("role_editUI")'><td>&nbsp;<s:a onclick="edit('%{id}')" includeParams="role_editUI">修改</s:a></td></s:if>
				<s:if test='#session.user.hasPrivilegeByUrl("role_delete")'><td>&nbsp;<s:a action="role_delete?id=%{id}" includeParams="role_delete" onclick="return window.confirm('确定要删除吗?')">删除</s:a>
				</td></s:if>
				<s:if test='#session.user.hasPrivilegeByUrl("role_addUI")'><td>&nbsp;<s:a action="role_setPrivilegeUI?id=%{id}" includeParams="role_addUI">设置权限</s:a>
				</td></s:if>
			</tr>
		</s:iterator>
	</table>

</body>
</html>
