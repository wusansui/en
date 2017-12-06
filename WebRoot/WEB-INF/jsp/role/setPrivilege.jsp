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

<title>My JSP 'setPrivilege.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
<script type="text/javascript" src="jquery/jquery_treeview/jquery.treeview.js"></script>
<link rel="stylesheet" href="jquery/jquery_treeview/jquery.treeview.css" type="text/css"></link>
<script type="text/javascript">
	$(function() {

	// 给所有的权限复选框添加事件
	$("[name=privilegeIds]").click(function(){
		// 自己选中或取消时，把所有的下级权限也都同时选中或取消
		$(this).siblings("ul").find("input").prop("checked",this.checked);

		// 当选中一个权限时，也要同时选中所有的直系上级权限
		if (this.checked) {
			$(this).parents("li").children("input").prop("checked",true);
		}
		// 当取消一个权限时，同级没有选中的权限了，就也取消他的上级权限，再向上也这样做。
		else {
			if ($(this).parent().siblings("li").children("input:checked").size() == 0) {
			
				$(this).parent().parent().siblings("input").prop("checked", false);

				var start = $(this).parent().parent();
				if (start.parent().siblings("li").children("input:checked").size() == 0) {
				
					start.parent().parent().siblings("input").prop("checked", false);
				}
			}
		}
	});

	});
	
</script>
</head>

<body>

	<!--显示表单内容-->
	<s:form action="role_setPrivilege" method="post">
		<s:hidden name="id"></s:hidden>
    	
                      正在为<font color="blue">${role.name}</font>配置权限  &nbsp;&nbsp;&nbsp;
      
				<!-- 全选 -->
	    <input type="checkbox" id="cbSelectAll" onclick="$('[name=privilegeIds]').prop('checked', this.checked)" />
		<label for="cbSelectAll">全选</label>
			
        <!-- 表单内容显示 -->
		<table  style="width: 300;border: 0">
			

			<!-- 显示权限树 -->
			<tr>
			<td>
		    <ul id="root">
				<%-- 第一级 --%>
			  <s:iterator value="#topPrivilegeList">
				<li>
				  <input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}"  <s:property value="%{id in privilegeIds ? 'checked' : ''}"/>> 
				  <label for="cb_${id}"><span	class="folder">${name}</span> </label>
			   
			    <ul>
				  <%-- 第二级 --%>
				  <s:iterator value="children">
				  <li>
				    <input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}"	<s:property value="%{id in privilegeIds ? 'checked' : ''}"/>> 
				    <label for="cb_${id}"> <span	class="folder">${name}</span> </label>
						<ul>
						<%-- 第三级 --%>
						  <s:iterator value="children">
							<li>
							<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}"	<s:property value="%{id in privilegeIds ? 'checked' : ''}"/>> 
							<label for="cb_${id}"><span	class="folder">${name}</span> </label>
							</li>
						  </s:iterator>
					    </ul>
				  </li>
				  </s:iterator>
				</ul>
			    </li>
		       </s:iterator>
			</ul>
		    </td>
		    </tr>
        </table>

		<script type="text/javascript">
			$("#root").treeview();
		</script>


		<!-- 表单操作 -->
		<input type="submit" value="提交" style="background-color: blue;color: white;"/>
		<input type="button" value="返回"  onclick="history.go(-1)" style="background-color: blue;color: white"/>
	</s:form>

	<div>
		说明：<br /> 1，选中一个权限时：<br /> &nbsp;&nbsp;&nbsp;&nbsp; a，应该选中他的所有直系上级。<br /> &nbsp;&nbsp;&nbsp;&nbsp; b，应该选中他的所有直系下级。<br />
		2，取消选择一个权限时：<br /> &nbsp;&nbsp;&nbsp;&nbsp; a，应该取消选择他的所有直系下级。<br /> &nbsp;&nbsp;&nbsp;&nbsp;
		b，如果同级的权限都是未选择状态，就应该取消选中他的直接上级，并向上做这个操作。<br /> 3，全选/取消全选。<br /> 4，默认选中当前岗位已有的权限。<br />
	</div>

</body>
</html>
