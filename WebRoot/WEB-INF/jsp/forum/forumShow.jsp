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
    
    <title>My JSP 'forumShow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="bootstrap/js/jQuery.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
	
		//跳到第几页
	$(function(){
		
		$("#go").click(function(){
			var val = $("#pageNo").val();
			val = $.trim(val);
			//1. 校验 val 是否为数字 
			var flag = false;
			var reg = /^\d+$/g;
			var pageNo = 0;
			
			if(reg.test(val)){
				//2. 校验 val 在一个合法的范围内： 1-totalPageNumber
				pageNo = parseInt(val);
				//'${page.totalPage}',单引号和双引号都可以
				if(pageNo >= 1 && pageNo <= parseInt('${page.totalPage}')){
					flag = true;
				}
			}
			
			if(!flag){
				alert("输入的不是合法的页码.");
				$(this).val("");
				return;
			}
			var href = "forum_show?id=${forum.id}&pageInfo.currentPage=" + pageNo;
			window.location.href = href;
		});
	});
	</script>

  </head>
  
  <body style="margin: 20">
    <span>【${forum.name}】中的主题列表</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span><s:a action="topic_addUI?forumId=%{#forum.id}" >发表主题</s:a></span>
    
    <table class="table table-bordered table-hover">
    	<tr>
    		<td>主题</td>
    		<td>作者</td>
    		<td>回复数</td>
    		<td>最后回复</td>
    		<s:if test='#session.user.hasPrivilegeByUrl("topic_delete")'><td>删除</td></s:if>
    	</tr>
    	<s:iterator value="#topicList">
    		<tr>
    			<td>
	    			<img src="images/topicType/topicType_${type}.gif" />
	    			<s:a action="topic_show?id=%{id}">${title}</s:a>
    			</td>
    			<td>
    				<ul>
						<li>${author.loginName}</li>
						<li><s:date name="postTime" format="yyyy-MM-dd HH:mm:ss"/></li>
					</ul>
    			</td>
    			<td>${replyCount}</td>
    			<td>
    				<ul>
						<li>${lastReply.author.loginName}</li>
						<li><s:date name="lastReply.postTime" format="yyyy-MM-dd HH:mm:ss"/></li>
					</ul>
    			</td>
    			<s:if test='#session.user.hasPrivilegeByUrl("topic_delete")'>
    			<td><s:a action="topic_delete?id=%{id}&forumId=%{#forum.id}&pageInfo.currentPage=%{#page.currentPage}" onclick="return confirm('确定删除本主题及其所有的回复吗?')">删除</s:a></td></s:if>
    		</tr>
    	</s:iterator>
    </table>
    
    <!-- 分页的实现代码 -->
    <div align="center" style="font-size: 18">
	<s:if test="#topicList!=null&&#topicList.size()!=0">
	
          总记录：${page.totalRecord}条 &nbsp;&nbsp;
	每页：${page.size}条 &nbsp;&nbsp;
	页码：第${page.currentPage}页
	/共	${page.totalPage}页&nbsp;&nbsp;
	
	<a href="forum_show?id=${forum.id}&pageInfo.currentPage=1" >首页</a>
	<s:if test="#page.hasPrev">
		 <a href="forum_show?id=${forum.id}&pageInfo.currentPage=${page.currentPage-1}" >上一页</a>
	</s:if>
	<s:else>
		上一页
	</s:else>
	<s:if test="#page.hasNext">
		<a href="forum_show?id=${forum.id}&pageInfo.currentPage=${page.currentPage+1}" >下一页</a>
	</s:if>
	<s:else>
		下一页
	</s:else>
    <a href="forum_show?id=${forum.id}&pageInfo.currentPage=${page.totalPage}" >末页</a>
    &nbsp;&nbsp;转到 <input type="text" style="width: 50" id="pageNo"/> 页&nbsp;
     <button type="button" class="btn btn-primary"  id="go" style="width: 12;height: 30">go</button>
   </s:if>
   </div>
  </body>
</html>
