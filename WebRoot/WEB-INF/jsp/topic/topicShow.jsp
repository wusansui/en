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

<title>My JSP 'topicShow.jsp' starting page</title>

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
	$(function() {

		$("#go")
				.click(
						function() {
							var val = $("#pageNo").val();
							val = $.trim(val);
							//1. 校验 val 是否为数字 
							var flag = false;
							var reg = /^\d+$/g;
							var pageNo = 0;

							if (reg.test(val)) {
								//2. 校验 val 在一个合法的范围内： 1-totalPageNumber
								pageNo = parseInt(val);
								//'${page.totalPage}',单引号和双引号都可以
								if (pageNo >= 1
										&& pageNo <= parseInt('${page.totalPage}')) {
									flag = true;
								}
							}

							if (!flag) {
								alert("输入的不是合法的页码.");
								$(this).val("");
								return;
							}
							var href = "topic_show?id=${topic.id}&pageInfo.currentPage="
									+ pageNo;
							window.location.href = href;
						});
	});
</script>
</head>

<body style="margin: 20">

	<div>
		<font> &gt;&gt; </font>
		<s:a action="forum_list">论坛</s:a>
		<font> &gt;&gt; </font>
		<s:a action="forum_show?id=%{#topic.forum.id}">${topic.forum.name}</s:a>
		<font> &gt;&gt; </font> 帖子阅读
	</div>

	<hr />

	<div align="right">
		<s:a action="reply_addUI?topicId=%{#topic.id}">回复</s:a>
		<s:a action="topic_setType?id=%{#topic.id}&type=1"
			onClick="return confirm('要把本主题设为精华吗？')">精华</s:a>
		<s:a action="topic_setType?id=%{#topic.id}&type=2"
			onClick="return confirm('要把本主题设为置顶吗？')">置顶</s:a>
		<s:a action="topic_setType?id=%{#topic.id}&type=0"
			onClick="return confirm('要把本主题设为普通吗？')">普通</s:a>
	</div>

	<div>
		【主题】:<img width="19" height="19"
			src="images/face/${topic.faceIcon}.gif" /> ${topic.title}
	</div>

	<table class="table table-bordered table-hover">
		<%-- <s:if test='%{#page.currentPage==1}'>
		<tr>
			<td width="130">
				<!--作者头像-->
				<div>
					<img border="0" alt="暂无头像"
						src="user_showImage?loginName=${topic.author.loginName}" />
				</div> <!--作者名称-->
				<div>${topic.author.loginName}</div>
			</td>
			<td>
				<div>${topic.content}</div>
			</td>
			<td>
				<ul>
					<li>楼主</li>
					<li><s:date name="%{#topic.postTime}"
							format="yyyy-MM-dd HH:mm:ss" /></li>
				</ul>
			</td>
			<td>&nbsp;</td>
		</tr>
		</s:if> --%>

		<s:iterator value="#replyList" status="status">
			<tr>
				<td width="130">
					<!--作者头像-->
					<div>
						<img border="0" alt="暂无头像"
							src="user_showImage?loginName=${author.loginName}" />
					</div> <!--作者名称-->
					<div>${author.loginName}</div>
				</td>
				<td>
					<div>${content}</div>
				</td>
				<td>
					<ul>
						<li><s:if
								test='%{(#page.currentPage-1)*#page.size+#status.count==1}'>楼主</s:if>
							<s:elseif
								test='%{(#page.currentPage-1)*#page.size+#status.count==2}'>沙发</s:elseif>
							<s:elseif
								test='%{(#page.currentPage-1)*#page.size+#status.count==3}'>板凳</s:elseif>
							<s:elseif
								test='%{(#page.currentPage-1)*#page.size+#status.count==4}'>地板</s:elseif>
							<s:else>${(page.currentPage-1)*page.size+status.count}楼</s:else>
						</li>
						<li><s:date name="%{postTime}" format="yyyy-MM-dd HH:mm:ss" />
						</li>
					</ul>
				</td>
				<s:if test='#session.user.hasPrivilegeByUrl("reply_delete")'><td><s:if
						test='%{(#page.currentPage-1)*#page.size+#status.count==1}'>&nbsp;</s:if>
					<s:else><s:a
						action="reply_delete?id=%{id}&topicId=%{#topic.id}&pageInfo.currentPage=%{#page.currentPage}"
						onclick="return confirm('确定要删除本回帖吗?')">删除</s:a></s:else>
					</td></s:if>
			</tr>
		</s:iterator>
	</table>
	<!-- 分页的实现代码 -->
	<div align="center" style="font-size: 18">
		<s:if test="#replyList!=null&&#replyList.size()!=0">
	
          总记录：${page.totalRecord}条 &nbsp;&nbsp;
	每页：${page.size}条 &nbsp;&nbsp;
	页码：第${page.currentPage}页
	/共	${page.totalPage}页&nbsp;&nbsp;
	
	<a href="topic_show?id=${topic.id}&pageInfo.currentPage=1">首页</a>
			<s:if test="#page.hasPrev">
				<a
					href="topic_show?id=${topic.id}&pageInfo.currentPage=${page.currentPage-1}">上一页</a>
			</s:if>
			<s:else>
		上一页
	</s:else>
			<s:if test="#page.hasNext">
				<a
					href="topic_show?id=${topic.id}&pageInfo.currentPage=${page.currentPage+1}">下一页</a>
			</s:if>
			<s:else>
		下一页
	</s:else>
			<a
				href="topic_show?id=${topic.id}&pageInfo.currentPage=${page.totalPage}">末页</a>
     &nbsp;&nbsp;转到 <input type="text" style="width: 50" id="pageNo" /> 页&nbsp;
     <button type="button" class="btn btn-primary" id="go"
				style="width: 12;height: 30">go</button>
		</s:if>
	</div>
</body>
</html>
