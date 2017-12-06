<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showImage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 </head>  
<body>  
    <div >  
        <img src="leaveApply_getProcessPic?procDefId=${procDefId}" style="position:absolute; left:0px; top:0px;">  
        <!-- 给执行的节点加框 -->  
        <div style="position:absolute; border:2px solid red;left:${coordinateObj.x-1 }px;top:${coordinateObj.y-1 }px;width:${coordinateObj.width }px;height:${coordinateObj.height }px;"></div>  
    </div>  
  
</body>  
</html>  
