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
    
    <title>My JSP 'forumManageList.jsp' starting page</title>
    
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
		var path = "forumManage_addUI";
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href = "forumManage_list";
	}

	function edit(id) {

		var path = "forumManage_editUI?id=" + id;
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href = "forumManage_list";
	}

	</script>
  </head>
  
  <body style="margin: 20">
  	<!-- 其他功能超链接 -->
	<s:a onclick="add()" includeParams="forumManage_addUI">添加</s:a>
	
	<table class="table table-bordered table-hover" width="600px">

		<tr>
			<td>版块名称</td>
			<td>版块说明</td>
			<td>上移</td>
			<td>下移</td>
			<td>修改</td>
			<td>删除</td>
		</tr>

		<!--显示数据列表-->
		<s:iterator value="#forumList" status="status">
			<tr>
				<td>${name}</td>
				<td>${note}</td>
				<td>
				    <s:if test="#status.first">
						<font color="gray" style="cursor:pointer">上移</font>
					</s:if> 
					<s:else>
						<s:a action="forumManage_moveUp?id=%{id}">上移</s:a>
					</s:else>
				</td>
				<td>
				    <s:if test="#status.last">
						<font color="gray" style="cursor:pointer">下移</font>
					</s:if> 
					<s:else>
						<s:a action="forumManage_moveDown?id=%{id}">下移</s:a>
					</s:else>
				</td>
				<td><s:a onclick="edit('%{id}')" includeParams="forumManage_editUI">修改</s:a></td>
				<td><s:a action="forumManage_delete?id=%{id}"  onclick="return window.confirm('确定要删除吗?')">删除</s:a>
				</td>
			</tr>
		</s:iterator>
	</table>
  </body>
</html>
