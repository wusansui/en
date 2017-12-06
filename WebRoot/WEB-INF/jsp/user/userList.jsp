<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userList.jsp' starting page</title>
    
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
	
	
	function add(){
	
		var path="user_addUI";
	    var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href="user_getUsersByPage?pageInfo.currentPage=${page.currentPage}"+"&"+serializeVal;
	}
	
	//编辑员工信息
	function edit(id){
	
	    
	    var serializeVal = $(".hidden1").serialize();
	    
		var path="user_editUI?pageInfo.currentPage=${page.currentPage}"+"&"+serializeVal+"&id="+id;
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		window.location.href="user_getUsersByPage?pageInfo.currentPage=${page.currentPage}"+"&"+serializeVal;
		//先加上alert,不然不对
		alert("");
	}
	
	//删除
	function del(id){
		
		if(window.confirm("您确定要删除吗?")){
		
	    var tlength=$("#table").find("tr").length;
	    var serializeVal = $(".hidden1").serialize();
		var path="user_delete?currentPage=${page.currentPage}"+"&"+serializeVal+"&id="+id;
		//窗口状态
		var OPEN_WINDOW_STATE = "dialogWidth=600px;dialogHeight=400px;scroll=yes;resizable=no;status=no;center=yes";
		//显示窗口
		window.showModalDialog(path, window, OPEN_WINDOW_STATE);
		
		//判断表格的行数,若是最后一行数据,删除后就查询前一行的数据,若当前是第一页,还查询第一页
		if(tlength==3&&'${page.currentPage-1}'>1){
		window.location.href = "user_getUsersByPage?pageInfo.currentPage=${page.currentPage-1}"+"&"+serializeVal;
		
		}else{
		window.location.href = "user_getUsersByPage?pageInfo.currentPage=${page.currentPage}"+"&"+serializeVal;
		
		}
		alert("");
		}
		else{
		return;
		}
	}
	
	//点击查询按钮的响应事件
	$(function(){
		$("#sub").click(function(){
			var name=$("#n1").val();
			var age1=$("#a1").val();
			var age2=$("#a2").val();
			
			if(name==undefined||name==null){
				name="";
			}
			if(age1==undefined||age1==null){
				age1="";
			}
			if(age2==undefined||age2==null){
				age2="";
			}
			if(age1<0||age1>99||age2<0||age2>99){
				alert("年龄应在0-99之间");
				return;
			}
		
			
			var href = "user_getUsersByPage?name="+name+"&age1="+age1+"&age2="+age2;
			window.location.href = href;
		});
	});
	
	//传递查询条件,点击首页，上一页等，传递参数
 	$(function(){
 	
		$(".hr1").click(function(){
				//序列化隐藏域中的name，value值为字符串
				var serializeVal = $(".hidden1").serialize();
				var href =this.href+"&"+serializeVal;
				window.location.href = href;			
				return false;
			});
	});
	
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
			var href = "user_getUsersByPage?pageInfo.currentPage=" + pageNo + "&" + $(".hidden1").serialize();
			window.location.href = href;
		});
	});
</script>
  </head>
  <body>
  		<s:form action="user_getUsersByPage" method="post" style="margin: 20">
  <%-- 		<span><font size="4">用户管理>>--»</font></span> --%><br>&nbsp;&nbsp;&nbsp;&nbsp;
  		<s:a onclick="add()" includeParams="user_addUI"><font size="4">添加用户</font></s:a>&nbsp;&nbsp;&nbsp;&nbsp;
	 	真实姓名
	 	<input type="text"  name="name" id="n1" style="height: 30;width: 150">&nbsp;&nbsp;&nbsp;&nbsp;
	 	年龄范围
	 	<input type="text"  name="age1" id="a1" maxlength="2" style="height: 30;width: 100"/>
	 	—
	 	<input type="text"  name="age2" id="a2" maxlength="2" style="height: 30;width: 100"/>&nbsp;&nbsp;
	 	
	 	 <button type="button" class="btn btn-primary"  id="sub">查 询</button>
	 	
	 	<%-- 通过隐藏域传递查询条件，name为参数名，${param.n1 }为参数设置值，从地址栏中取
	 	当点击查询后,查询参数会出现在地址栏,通过${param.name }取得地址栏中参数为name的值,隐藏域名为name,是为了拼接字符串而用
	 	后台就用name取参数的值,text里的name也是后台取值,所以2个name属性一样 --%>
	 	
	 	<input type="hidden" name="name" class="hidden1" value="${param.name }"/>
	 	<input type="hidden" name="age1" class="hidden1" value="${param.age1 }"/>
	 	<input type="hidden" name="age2" class="hidden1" value="${param.age2 }"/>
	 	
		<br><br>	
	<table class="table table-bordered table-hover" id="table">
	
	<s:if test="#request.userList==null||#request.userList.size()==0">
		<tr>
	<td colspan="9">没有员工信息</td>
	</tr>
	</s:if>
	
	<s:else>
		    <tr style="background-color: #B9D3EE;">
			 	<th><font color="#0000CD">登录名</font></th>
			 	<th><font color="#0000CD">真实姓名</font></th>
			 	<th><font color="#0000CD">年龄</font></th>
			 	<th><font color="#0000CD">性别</font></th>
			 	<th><font color="#0000CD">电话</font></th>
			 	<th><font color="#0000CD">电子邮件</font></th>
			 	<th><font color="#0000CD">学历</font></th>
			 	<s:if test='#session.user.hasPrivilegeByUrl("user_edit")'>
			 	<th><font color="#0000CD">编辑</font></th>
			 	</s:if>
			 	<s:if test='#session.user.hasPrivilegeByUrl("user_delete")'>
			 	<th><font color="#0000CD">删除</font></th>
			 	</s:if>
		 	</tr>
		<s:iterator value="#request.userList" status="st">
			 <s:if test="#st.odd">   
                        <tr style="background-color: #F0F8FF;">   
                            	<td>&nbsp;${loginName }</td>
				<td>&nbsp;${realName }</td>
				<td>&nbsp;${age }</td>
				<td>&nbsp;${gender }</td>
				<td>&nbsp;${phoneNumber }</td>
				<td>&nbsp;${email }</td>
				<td>&nbsp;${education }</td>
				<s:if test='#session.user.hasPrivilegeByUrl("user_edit")'><td>&nbsp;<s:a onclick="edit('%{id}')" includeParams="user_edit">编辑</s:a></td></s:if>
				<s:if test='#session.user.hasPrivilegeByUrl("user_delete")'><td>&nbsp;<s:a onclick="del('%{id}')" includeParams="user_delete">删除</s:a></td></s:if>
                        </tr>   
                    </s:if>   
                    <s:else>   
                        <tr style="background-color: #B9D3EE;">   
                           	<td>&nbsp;${loginName }</td>
				<td>&nbsp;${realName }</td>
				<td>&nbsp;${age }</td>
				<td>&nbsp;${gender }</td>
				<td>&nbsp;${phoneNumber }</td>
				<td>&nbsp;${email }</td>
				<td>&nbsp;${education }</td>
				<s:if test='#session.user.hasPrivilegeByUrl("user_edit")'><td>&nbsp;<s:a onclick="edit('%{id}')" includeParams="user_edit">编辑</s:a></td></s:if>
				<s:if test='#session.user.hasPrivilegeByUrl("user_delete")'><td>&nbsp;<s:a onclick="del('%{id}')" includeParams="user_delete">删除</s:a></td></s:if>
                        </tr>   
                    </s:else>   
			<%-- <tr>
				<td>&nbsp;${loginName }</td>
				<td>&nbsp;${realName }</td>
				<td>&nbsp;${age }</td>
				<td>&nbsp;${gender }</td>
				<td>&nbsp;${phoneNumber }</td>
				<td>&nbsp;${email }</td>
				<td>&nbsp;${education }</td>
				<td>&nbsp;<s:a onclick="edit('%{id}')" includeParams="user_edit">编辑</s:a></td>
				<td>&nbsp;<s:a onclick="del('%{id}')" includeParams="user_delete">删除</s:a></td>
			</tr> --%>
		</s:iterator>
	</s:else>
	</table>
	
	<!-- 分页的实现代码 -->
	<div align="center" style="font-size: 18">
	<s:if test="#request.userList!=null&&#request.userList.size()!=0">
	
          总记录：${page.totalRecord}条 &nbsp;&nbsp;
	每页：${page.size}条 &nbsp;&nbsp;
	页码：第${page.currentPage}页
	/共	${page.totalPage}页&nbsp;&nbsp;
	
	<a href="user_getUsersByPage?pageInfo.currentPage=1" class="hr1">首页</a>
	<s:if test="#request.page.hasPrev">
		 <a href="user_getUsersByPage?pageInfo.currentPage=${page.currentPage-1}" class="hr1">上一页</a>
	</s:if>
	<s:else>
		上一页
	</s:else>
	<s:if test="#request.page.hasNext">
		<a href="user_getUsersByPage?pageInfo.currentPage=${page.currentPage+1}" class="hr1">下一页</a>
	</s:if>
	<s:else>
		下一页
	</s:else>
    <a href="user_getUsersByPage?pageInfo.currentPage=${page.totalPage}" class="hr1">末页</a>
     &nbsp;&nbsp;转到 <input type="text" style="width: 50" id="pageNo"/> 页&nbsp;
     <button type="button" class="btn btn-primary"  id="go" style="width: 12;height: 30">go</button>
   </s:if>
   </div>
   </s:form>
</body>
</html>
