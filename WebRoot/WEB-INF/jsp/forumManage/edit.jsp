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

<body style="margin: 20">
	<s:form action="forumManage_edit" method="post"
		enctype="multipart/form-data">

		<s:hidden name="id"></s:hidden>
		<s:hidden name="position"></s:hidden>
		<div class="form-group">
			<label for="input1" class="col-sm-2 control-label">版块名称</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="input1" name="name"
					style="height: 30;width: 400" value="${name }" >
			</div>
		</div>
		<div class="form-group">
			<label for="input2" class="col-sm-2 control-label">版块说明</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="input2" name="note"
					style="height: 30;width: 400" value="${note}">
			</div>
		</div>
		<div class="form-group">
			<label for="input3" class="col-sm-2 control-label">请选择版块图片:</label>
			<div class="col-sm-10">
				<input type="file" name="image" style="height: 30;width: 400" />
			</div>
		</div>
		<br>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary">提交</button>
			</div>
		</div>

	</s:form>

</body>
</html>
