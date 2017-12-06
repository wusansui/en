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
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">
	
		function resetValue() {
			document.getElementById("loginName").value = "";
			document.getElementById("password").value = "";
			document.getElementById("imageCode").value = "";
		}
		function loadimage() {
			document.getElementById("randImage").src = "image.jsp?"
					+ Math.random();
		}
	</script>
  </head>
  
  <body>
   <div align="center" style="padding-top: 50px;">
		<form action="user_login" method="post">
		<table  width="1000" height="500" style="background:url(images/login.jpg)" >
			<tr height="220">   
				<td colspan="4"></td>
			</tr>
			<tr height="20">
				<td width="20%"></td>
				<td width="10%">用户名</td>
				<td><input type="text"  name="loginName" value="${loginName }" id="loginName"/></td>
				<td width="50%"></td>
			</tr>
			<tr height="20">
				<td></td>
				<td>密  码</td>
				<td><input type="password"  name="password" value="${password }" id="password"/></td>
				<td></td>
			</tr>
			<tr height="20">
				<td></td>
				<td>验证码</td>
				<td ><input type="text"  name="imageCode" id="imageCode" size="10" />&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></td>
				<td></td>
			</tr>
			<tr height="20">
				<td></td>
				<td><input type="submit" value="登录" style="background-color: 005083;color: white"/></td>
				<td><input type="button" value="重置" onclick="resetValue()" style="background-color: 005083;color: white"/></td>
				<td></td>
			</tr>
			<tr height="20">
				<td></td>
				<td colspan="3">
					<font color="red"><s:fielderror fieldName="userError"></s:fielderror>
					<s:fielderror fieldName="codeError"></s:fielderror>
					</font>
				</td>
			</tr>
			<tr></tr>
		</table>
		</form>
	</div>
</body>
  
</html>
