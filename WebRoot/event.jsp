<%@page import="com.oa.pojo.Calendar"%>
<%@page import="com.oa.dao.CalendarDao"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	String action = request.getParameter("action");
	if("add".equals(action)){
		String date = request.getParameter("date");
		String enddate = request.getParameter("end");
		if(date.equals(enddate)){
			enddate = "";
		}
		String display = "";
		String chk = "";
		if("".equals(enddate)){
			display = "style=\"display:none\"";
			enddate = date;
		}else{
			chk = "checked";
		}
%>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<div class="fancy">
	<h3>新建事件</h3>
    <form id="add_form" action="calendar_add" method="post">
    <input type="hidden" name="action" value="<%=action%>">
    <p>日程内容：<input type="text" class="input" name="event" id="event" style="width:320px" placeholder="记录..."></p>
    <p>开始时间：<input type="text" class="input datepicker" name="startdate" id="startdate" value="<%=date%>" readonly>
    <span id="sel_start" style="display:none;"><select name="s_hour">
    	<option value="00">00</option>
        <option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08" selected>08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
    <select name="s_minute">
    	<option value="00" selected>00</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
    </select>
    </span>
    </p>
    <p id="p_endtime" <%=display %>>结束时间：<input type="text" class="input datepicker" name="enddate" id="enddate" value="<%=enddate%>" readonly>
    <span id="sel_end" style="display:none"><select name="e_hour">
    	<option value="00">00</option>
    	<option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08">08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12" selected>12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
    <select name="e_minute">
    	<option value="00" selected>00</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
    </select>
    </span>
    </p>
    <p>
    <label><input type="checkbox" value="1" id="isallday" name="isallday" checked> 全天</label>
    <label><input type="checkbox" value="1" id="isend" name="isend" <%=chk %>> 结束时间</label>
    </p>
    <div class="sub_btn"><span class="del"><input type="button" class="btn btn_del" id="del_event" value="删除"></span><input type="submit" class="btn btn_ok" value="确定"> <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()"></div>
    </form>
</div>
<% 
	}else if("edit".equals(action)){
		Integer id = Integer.parseInt(request.getParameter("id"));
		CalendarDao calendarDao=(CalendarDao)WebApplicationContextUtils.getWebApplicationContext(application).getBean("calendarDao");
		Calendar calendar =calendarDao.getById(id);
		String title = calendar.getTitle();// 事件标题
		String start = calendar.getStart();// 事件开始时间
		String end = calendar.getEnd();// 结束时间
		Integer allDay = calendar.getAllDay();// 是否为全天事件
		String color = calendar.getColor();// 事件的背景
		
		String start_d = "";
		String start_h = "";
		String start_m = "";
		
		String end_d = "";
		String end_h = "";
		String end_m = "";
		
		if(allDay == 1 && !"".equals(end)){
			start_d = start;
			end_d = end;
		}else if(allDay == 1 && "".equals(end)){
			start_d = start;
		}else if(allDay == 0 && !"".equals(end)){
			start_d = start.substring(0,10);
			start_h = start.substring(11,13);
			start_m = start.substring(14,16);
			
			end_d = end.substring(0,10);
			end_h = end.substring(11,13);
			end_m = end.substring(14,16);
		}else{
			start_d = start.substring(0,10);
			start_h = start.substring(11,13);
			start_m = start.substring(14,16);
		}
%>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<div class="fancy">
	<h3>编辑事件</h3>
    <form id="add_form" action="calendar_edit" method="post">
    <input type="hidden" name="action" value="<%=action%>">
    <input type="hidden" name="id" id="eventid" value="<%=id%>">
    <p>日程内容：<input type="text" class="input" name="event" id="event" style="width:320px" placeholder="记录你将要做的一件事..." value="<%=title%>"></p>
    <p>开始时间：<input type="text" class="input datepicker" name="startdate" id="startdate" value="<%=start_d %>" readonly>
    <span id="sel_start" <%if("".equals(start_h)){ %>style="display: none;"<%} %> ><select name="s_hour">
    	<option value="<%=start_h %>>" selected><%=start_h %></option>
    	<option value="00">00</option>
        <option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08">08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
    <select name="s_minute">
    	<option value="<%=start_m %>" selected><%=start_m %></option>
    	<option value="00">00</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
    </select>
    </span>
    </p>
    <p id="p_endtime" <%if("".equals(end_d)){ %>style="display: none;"<%} %>>结束时间：<input type="text" class="input datepicker" name="enddate" id="enddate" value="<%=end_d %>" readonly>
    <span id="sel_end" <%if("".equals(end_h)){ %>style="display: none;"<%} %> ><select name="e_hour">
    	<option value="<%=end_h %>" selected><%=end_h %></option>
    	<option value="00">00</option>
    	<option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08">08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
    <select name="e_minute">
    	<option value="<%=end_m %>" selected><%=end_m %></option>
    	<option value="00">00</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
    </select>
    </span>
    </p>
    <p>
    <label><input type="checkbox" value="1" id="isallday" name="isallday" <%if(1 == allDay){ %> checked="checked" <%} %>> 全天</label>
    <label><input type="checkbox" value="1" id="isend" name="isend"  <%if(!"".equals(end)){ %> checked="checked" <%} %>> 结束时间</label>
    </p>
    <div class="sub_btn"><span class="del"><input type="button" class="btn btn_del" id="del_event" value="删除"></span><input type="submit" class="btn btn_ok" value="确定"> <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()"></div>
    </form>
</div>
<% 
	}
%>
<script type="text/javascript" src="js/jquery.form.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".datepicker").datepicker();
	$("#isallday").click(function(){
		if($("#sel_start").css("display")=="none"){
			$("#sel_start,#sel_end").show();
		}else{
			$("#sel_start,#sel_end").hide();
		}
	});
	
	$("#isend").click(function(){
		if($("#p_endtime").css("display")=="none"){
			$("#p_endtime").show();
		}else{
			$("#p_endtime").hide();
		}
		$.fancybox.resize();//调整高度自适应
	});
	
	//提交表单
	$('#add_form').ajaxForm({
		beforeSubmit: showRequest, //表单验证
        success: showResponse //成功返回
    }); 
	
	//删除事件
	$("#del_event").click(function(){
		if(confirm("您确定要删除吗？")){
			var eventid = $("#eventid").val();
			$.post("calendar_delete",{id:eventid},function(msg){
				if(msg==1){//删除成功
					$.fancybox.close();
					$('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
				}else{
					alert(msg);	
				}
			});
		}
	});
});

function showRequest(){
	var events = $("#event").val();
	if(events==''){
		alert("请输入日程内容！");
		$("#event").focus();
		return false;
	}
}

function showResponse(responseText, statusText, xhr, $form){
	if(statusText=="success"){	
		if(responseText==1){
			$.fancybox.close();
			$('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
		}else{
			alert(responseText);
		}
	}else{
		alert(statusText);
	}
}
</script>