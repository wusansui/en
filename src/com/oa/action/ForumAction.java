package com.oa.action;

import java.util.List;

import com.oa.pojo.Forum;
import com.oa.pojo.Topic;
import com.oa.service.ForumManageService;
import com.oa.service.TopicService;
import com.oa.util.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ForumAction extends ActionSupport implements ModelDriven<Forum>{

	private ForumManageService forumManageService;
	private TopicService topicService;
	private Forum forum=new Forum();
	private PageInfo pageInfo;
	
	public String list(){
		List<Forum> forumList=forumManageService.findAll();
		ActionContext.getContext().put("forumList",forumList);
		return "forumList";
	}
	
	public ForumAction() {
		pageInfo=new PageInfo();
	}

	//展示版块详细
	public String show(){
		Forum f=forumManageService.getById(forum.getId());
		//Set<Topic> topic=f.getTopics();
		//List<Topic> topics=new ArrayList<Topic>(topic);
		//ActionContext.getContext().put("topics",topics);
		
		ActionContext.getContext().put("forum",f);
		
		//List<Topic> topicList=topicService.findByForum(f);
		
		//获取分页数据及总数量
		List<Topic> topicList=topicService.findByForum(f,pageInfo);
		int count=topicService.getCount(f);
		pageInfo.setTotalRecord(count);
		ActionContext.getContext().put("page",pageInfo);
		ActionContext.getContext().put("topicList",topicList);
		return "forumShow";
	}
	
	
	public void setForumManageService(ForumManageService forumManageService) {
		this.forumManageService = forumManageService;
	}

	@Override
	public Forum getModel() {
		return forum;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	
}
