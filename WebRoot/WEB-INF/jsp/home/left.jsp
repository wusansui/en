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

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/menu.css">
	
<script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
<script type="text/javascript">
	function menuChange(menu){
		$(menu).next().toggle();
	}
</script>
<body>
<div id="Menu"> 
	<ul id="MenuUl">
		<s:iterator value="#application.topPrivilegeList">
			<s:if test="#session.user.hasPrivilegeByName(name)">
				<li class="level1"><div class="level1Style" style="width: 80;" onclick="menuChange(this)"><img src="images/menuIcon/${icon }" />${name }</div>
				<!-- 隐藏二级菜单 -->
				<div style="display: none">
					<ul class="MenuLevel2">
						<s:iterator value="children">
							<s:if test="#session.user.hasPrivilegeByName(name)">
								<li class="level2">
									<div class="level2Style">
										<img src="images/menuIcon/menu_arrow_single.gif" />
										<a target="right" href="${url }" style="text-decoration: none;">${name }</a>
									</div>
								</li>
							</s:if>
						</s:iterator>
					</ul>
				</div>
				</li>
			</s:if>
		</s:iterator>
	</ul>
</div>
</body>
</html>
