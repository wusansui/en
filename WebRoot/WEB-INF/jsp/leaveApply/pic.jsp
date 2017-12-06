<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStream"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pic.jsp' starting page</title>
    
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
    <%  
      
    InputStream is = (InputStream)request.getAttribute("inputStream");  
      
    byte[] b = new byte[1024];  
    int len = -1;  
    while((len = is.read(b, 0, 1024)) != -1) {  
        response.getOutputStream().write(b, 0, len);  
        // 防止异常：getOutputStream() has already been called for this response  
        out.clear();  
        out = pageContext.pushBody();  
    }     
  
%> 
  </body>
</html>
