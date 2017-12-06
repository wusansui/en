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
    
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
	<script type="text/javascript">
		$(function(){
			var oFCKeditor = new FCKeditor( 'content' ) ; // 提交表单时本字段使用的参数名
			oFCKeditor.BasePath	= "fckeditor/" ; // 必须要有，这是指定editor文件夹所在的路径，一定要以'/'结尾
			oFCKeditor.Height	= "95%" ;
			oFCKeditor.Width	= "95%" ;
			oFCKeditor.ToolbarSet = "bbs" ;
			oFCKeditor.ReplaceTextarea(); // 替换id或name为指定值的textarea
		});
	</script>

  </head>
  
  <body>

    <div>
		<font> &gt; </font>
		<s:a action="forum_list">论坛</s:a>
		<font> &gt; </font>
		<s:a action="forum_show?id=%{#topic.forum.id}">${topic.forum.name}</s:a>
		<font> &gt;&gt; </font>
		帖子回复
	</div>
	
	<s:form action="reply_add" method="post">
		<s:hidden name="topicId" />
		<table border="1" color="grey" width="1000">
			<tr>
				<td>帖子主题</td>
				<td>${topic.title}</td>
			</tr>
			<tr>
				<td>回帖内容</td>
				<td><s:textarea name="content" /></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 20"><input type="submit" value="添加" style="background-color: 005083;color: white"/></td>
			</tr>
		</table>
	</s:form>
  </body>
</html>
