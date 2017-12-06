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
    
    <title>My JSP 'forumList.jsp' starting page</title>
    
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
  			<th>版块</th>
  			<th>主题数</th>
  			<th>文章数</th>
  			<th>最后发表的主题</th>
  		</tr>
  		<s:iterator value="#forumList">
  			<tr>
  				<td>
	  				<!--版块头像-->
					<div>
						<img border="0" alt="暂无图片" src="forumManage_showImage?id=${id}" />
					</div>
					<!--版块名称-->
					<div><s:a action="forum_show?id=%{id}" >${name}</s:a></div>
  				</td>
  				<td>${topicCount}</td>
  				<td>${articleCount}</td>
  				
  			<td>
  				<ul>
					<li><font color="#444444">┌ 主题：</font> 
						<s:a cssClass="ForumTitle" action="topic_show?id=%{lastTopic.id}">${lastTopic.title}</s:a>
					</li>
					<li><font color="#444444">├ 作者：</font> ${lastTopic.author.loginName}</li>
					<li><font color="#444444">└ 时间：</font> <s:date name="%{lastTopic.postTime}" format="yyyy-MM-dd HH:mm:ss" /></li>
				</ul>
  				</td></tr>
  		</s:iterator>
  	</table>
  </body>
</html>
