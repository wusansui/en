package com.oa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.Calendar;
import com.oa.service.CalendarService;
import com.oa.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class CalendarAction extends ActionSupport {

	private CalendarService calendarService;

	public String index() {
		return "index";
	}

	public void add() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String events = request.getParameter("event");// 事件内容
		String isallday = request.getParameter("isallday");// 是否是全天事件
		String isend = request.getParameter("isend");// 是否有结束时间
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String s_time = request.getParameter("s_hour") + ":"
				+ request.getParameter("s_minute") + ":00";
		String e_time = request.getParameter("e_hour") + ":"
				+ request.getParameter("e_minute") + ":00";

		String start = "";
		String end = "";
		if ("1".equals(isallday) && "1".equals(isend)) {
			start = startdate;
			end = enddate;
		} else if ("1".equals(isallday) && isend == null) {
			start = startdate;
		} else if (isallday == null && "1".equals(isend)) {
			start = startdate + " " + s_time;
			end = enddate + " " + e_time;
			isallday = "0";
		} else {
			start = startdate + " " + s_time;
			isallday = "0";
		}

		String[] colors = { "#360", "#f30", "#06c" };
		int index = (int) (Math.random() * colors.length);
		Calendar calendar = new Calendar();
		calendar.setTitle(events);
		calendar.setStart(start);
		calendar.setEnd(end);
		calendar.setAllDay(Integer.parseInt(isallday));
		calendar.setColor(colors[index]);
		boolean b = calendarService.add(calendar);
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			if (b) {
				out.print("1");
			} else {
				out.print("写入失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void edit() {
		HttpServletRequest request = ServletActionContext.getRequest();

		Integer id = Integer.parseInt(request.getParameter("id"));
		String events = request.getParameter("event");// 事件内容
		String isallday = request.getParameter("isallday");// 是否是全天事件
		String isend = request.getParameter("isend");// 是否有结束时间
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String s_time = request.getParameter("s_hour") + ":"
				+ request.getParameter("s_minute") + ":00";
		String e_time = request.getParameter("e_hour") + ":"
				+ request.getParameter("e_minute") + ":00";

		String start = "";
		String end = "";
		if ("1".equals(isallday) && "1".equals(isend)) {
			start = startdate;
			end = enddate;
		} else if ("1".equals(isallday) && isend == null) {
			start = startdate;
		} else if (isallday == null && "1".equals(isend)) {
			start = startdate + " " + s_time;
			end = enddate + " " + e_time;
			isallday = "0";
		} else {
			start = startdate + " " + s_time;
			isallday = "0";
		}

		String[] colors = { "#360", "#f30", "#06c" };
		int index = (int) (Math.random() * colors.length);
		Calendar calendar = new Calendar();
		calendar.setTitle(events);
		calendar.setStart(start);
		calendar.setEnd(end);
		calendar.setAllDay(Integer.parseInt(isallday));
		calendar.setColor(colors[index]);
		calendar.setId(id);
		boolean b = calendarService.edit(calendar);
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			if (b) {
				out.print("1");
			} else {
				out.print("写入失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void delete() {
		HttpServletRequest request = ServletActionContext.getRequest();

		Integer id = Integer.parseInt(request.getParameter("id"));
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			if (id > 0) {
				boolean b = calendarService.delete(id);
				if (b) {
					out.print("1");
				} else {
					out.print("删除失败！");
				}
			} else {
				out.print("事件不存在！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void find() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		List<Calendar> list = calendarService.findByUser();
		List<Calendar> list2 = new ArrayList<Calendar>();
		for (Calendar calendar : list) {
			Calendar c = new Calendar();
			c.setId(calendar.getId());
			c.setStart(calendar.getStart());
			c.setTitle(calendar.getTitle());
			c.setEnd(calendar.getEnd());
			c.setColor(calendar.getColor());
			c.setAllDay(calendar.getAllDay());
			list2.add(c);
		}
		String json = JSONSerializer.toJSON(list2).toString();
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void drag() {
		HttpServletRequest request = ServletActionContext.getRequest();

		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer daydiff = Integer.parseInt(request.getParameter("daydiff")) * 24 * 60 * 60;
		Integer minudiff = Integer.parseInt(request.getParameter("minudiff")) * 60;
		String allday = request.getParameter("allday");
		Calendar calendar = calendarService.getById(id);
		String start = calendar.getStart();
		long lstart = DateUtil.string2long(start);

		String end = calendar.getEnd();
		Calendar cal = calendarService.getById(id);
		boolean b;
		if ("true".equals(allday)) {
			if ("".equals(end)) {

				cal.setStart(DateUtil.long2string(lstart + daydiff));
				cal.setId(id);
				b = calendarService.edit(cal);
			} else {
				long lend = DateUtil.string2long(end);
				cal.setStart(DateUtil.long2string(lstart + daydiff));
				cal.setEnd(DateUtil.long2string(lend + daydiff));
				cal.setId(id);
				b = calendarService.edit(cal);
			}
		} else {
			Integer difftime = daydiff + minudiff;
			if ("".equals(end)) {
				cal.setStart(DateUtil.long2string(lstart + difftime));
				cal.setId(id);
				b = calendarService.edit(cal);
			} else {
				long lend = DateUtil.string2long(end);
				cal.setStart(DateUtil.long2string(lstart + difftime));
				cal.setEnd(DateUtil.long2string(lend + difftime));
				cal.setId(id);
				b = calendarService.edit(cal);
			}
		}
		PrintWriter out;

		try {
			out = ServletActionContext.getResponse().getWriter();
			if (b) {
				out.print("1");
			} else {
				out.print("拖拽失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void resize() {
		HttpServletRequest request = ServletActionContext.getRequest();

		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer daydiff = Integer.parseInt(request.getParameter("daydiff")) * 24 * 60 * 60;
		Integer minudiff = Integer.parseInt(request.getParameter("minudiff")) * 60;
		Calendar calendar = calendarService.getById(id);
		String start = calendar.getStart();
		long lstart = DateUtil.string2long(start);
		String end = calendar.getEnd();
		Integer difftime = daydiff + minudiff;
		Calendar cal = calendarService.getById(id);
		boolean b;
		if ("".equals(end)) {
			cal.setEnd(DateUtil.long2string(lstart + difftime));
			cal.setId(id);
			b = calendarService.edit(cal);
		} else {
			long lend = DateUtil.string2long(end);
			cal.setEnd(DateUtil.long2string(lend + difftime));
			cal.setId(id);
			b = calendarService.edit(cal);
		}
		PrintWriter out;

		try {
			out = ServletActionContext.getResponse().getWriter();
			if (b) {
				out.print("1");
			} else {
				out.print("缩放失败！");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public CalendarService getCalendarService() {
		return calendarService;
	}

	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

}
