package com.oa.pojo;

import java.util.Date;

public class LeaveBill {
	
	//请假单
	private Long id;
	// 请假天数
	private Integer days;
	// 请假原因
	private String content;
	// 请假离开时间
	private Date leaveDate;
	// 备注
	private String note;
	// 请假人
	private User user;
	// 请假单状态          0未申请,1正在审批,2为审批完成
	private Integer state = 0;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}

	
}
