package com.oa.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.pojo.User;
import com.oa.service.ReplyService;
import com.oa.service.TopicService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReplyAction extends ActionSupport implements ModelDriven<Reply>{

	private Long topicId;
	private ReplyService replyService;
	private TopicService topicService;
	private Reply reply=new Reply();
	
	public String addUI(){
		
		Topic t=topicService.getById(topicId);
		ActionContext.getContext().put("topic",t);
		return "add";
	}
	
	//添加新回复
	public String add(){
		
		Topic t=topicService.getById(topicId);
		//封装信息
		reply.setTopic(t);
		reply.setAuthor((User) ServletActionContext.getRequest().getSession().getAttribute("user"));
		reply.setPostTime(new Date());
		reply.setIpAddr(ServletActionContext.getRequest().getRemoteAddr());
		replyService.save(reply);
		return "toTopicShow";
	}
	
	//删除回复帖,涉及到引用问题,将回复贴改为 本回帖已删除
	public String delete(){
		Reply r=replyService.getById(reply.getId());
		r.setContent("<font color='red'>此回帖已被管理员删除</font>");
		replyService.update(r);
		return "delete";
	}

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}

	public ReplyService getReplyService() {
		return replyService;
	}

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	@Override
	public Reply getModel() {
		return reply;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}
	
}
