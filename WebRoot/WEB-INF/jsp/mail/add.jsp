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
	<style>
	body{font-size:12px;}
	body,ul,li,form,p,input{padding:0;margin:0;}
	li,ul{list-style-type:none;}
	li{line-height:20px;}
	li:hover{background:#F1F3FE;}
	form div{line-height:30px;}
	.loginform{width:345px;margin-left:20px;}
	.inputbg{line-height:22px;border:1px solid #dcdcdc;height:22px;width:200px;}
	.loginform label{width:140px;display:block;float:left;}
	.clear{clear:both;height:0;overflow:hidden;}
	.inputposition{position:relative;}
	.emaillist,.emaillist2{position:absolute;width:200px;left:140px;border:1px solid #dcdcdc;background:#fff;display:none;*top:22px;}
	.emaillist,.emaillist2 p{background:#EEEEEE;line-height:20px;}
	</style>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
	<script src="bootstrap/js/jQuery.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.11.2.js"></script>
	<script type="text/javascript">
		$(function(){  
			var mailList = new Array('@qq.com','@163.com','@126.com','@foxmail.com');
			$("#email").bind("keyup",function(){
				var val = $(this).val();
				if(val == '' || val.indexOf("@")>-1){
					$(".emaillist").hide();
					return false;
				}
				$('.emaillist').empty();
				for(var i = 0;i<mailList.length;i++){
				var emailText = $(this).val();
				$('.emaillist').append('<li class=addr>'+emailText+mailList[i]+'</li>');
				}
				$('.emaillist').show();
				$('.emaillist li').click(function(){
					$('#email').val($(this).text());
					$('.emaillist').hide();
				});	
			}).blur(function(){
				var val = $(this).val();
				if(val == '' || val.indexOf("@")>-1){
					$(".emaillist").hide();
					return false;
				}
			});			
		});
		
		$(function(){  
			var mailList = new Array('@qq.com','@163.com','@126.com','@foxmail.com');
			$("#email2").bind("keyup",function(){
				var val = $(this).val();
				if(val == '' || val.indexOf("@")>-1){
					$(".emaillist2").hide();
					return false;
				}
				$('.emaillist2').empty();
				for(var i = 0;i<mailList.length;i++){
				var emailText = $(this).val();
				$('.emaillist2').append('<li class=addr>'+emailText+mailList[i]+'</li>');
				}
				$('.emaillist2').show();
				$('.emaillist2 li').click(function(){
					$('#email2').val($(this).text());
					$('.emaillist2').hide();
				});	
			}).blur(function(){
				var val = $(this).val();
				if(val == '' || val.indexOf("@")>-1){
					$(".emaillist2").hide();
					return false;
				}
			});						
		});
	</script>
  </head>
  
  <body style="margin:20;margin-right: 400px">
	 <s:form method="post" action="sendMail_send">
	<table class="table table-bordered table-hover">
		<tr>
			<td>发件邮箱</td>
			<td>
			<input type="text" class="inputbg" id="email" name="mailFrom" style="height: 30;width: 400"
					>
			<ul class="emaillist">
            </ul><div class="clear"></div></td>
		</tr>
		<tr>
			<td>发件箱用户名</td>
			<td><input type="text" name="userName" style="height: 30;width: 400"></td>
		</tr>
		<tr>
			<td>发件箱密码</td>
			<td><input type="password" name="password" style="height: 30;width: 400"></td>
		</tr>
		<tr>
			<td>收件邮箱</td>
			<td><input type="text" name="mailTo" id="email2" style="height: 30;width: 400" class="inputbg"/>
			<ul class="emaillist2">
            </ul><div class="clear"></div></td>
		</tr>
		<tr>
			<td>邮件主题</td>
			<td><input type="text" name="subject" style="height: 30;width: 400"></td>
		</tr>
		<tr>
			<td>邮件内容</td>
			<td>
			<textarea rows="2" cols="100" name="content" style="height: 60;width: 400"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" style="padding-left: 40"><button type="submit" class="btn btn-primary">
			发送</button></td>
		</tr>
  	</table>
  </s:form>  
  </body>
</html>
