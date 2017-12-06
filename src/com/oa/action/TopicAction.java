package com.oa.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.Forum;
import com.oa.pojo.Reply;
import com.oa.pojo.Topic;
import com.oa.pojo.User;
import com.oa.service.ForumManageService;
import com.oa.service.ReplyService;
import com.oa.service.TopicService;
import com.oa.util.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TopicAction extends ActionSupport implements ModelDriven<Topic>{

	//版块id
	private Long forumId;
	private ForumManageService forumManageService;
	private TopicService topicService;
	private ReplyService replyService;
	private Topic topic=new Topic();
	private PageInfo pageInfo;
	
	
	public TopicAction() {
		pageInfo=new PageInfo();
	}

	public String show(){
		
		Topic t = topicService.getById(topic.getId());
		ActionContext.getContext().put("topic", t);
		
		//List<Reply> replyList=replyService.findByTopic(t);
		//分页显示,获取总数据条数
		List<Reply> replyList=replyService.findByTopic(t,pageInfo);
		int count=replyService.getCount(t);
		pageInfo.setTotalRecord(count);
		ActionContext.getContext().put("page", pageInfo);
		ActionContext.getContext().put("replyList", replyList);
		return "topicShow";
	}
	
	public String addUI() throws Exception {
		// 准备数据：forum
		Forum forum = forumManageService.getById(forumId);
		ActionContext.getContext().put("forum", forum);
		return "add";
	}

	/** 发表新主题 */
	public String add() throws Exception {
		
		// 表单中的字段, 已经封装了 title, content, faceIcon
		topic.setForum(forumManageService.getById(forumId));

		// 当前可以直接获取的信息
		// 作者，当前登录的用户
		topic.setAuthor((User) ServletActionContext.getRequest().getSession().getAttribute("user")); 
		// IP地址，当前请求中的IP信息
		topic.setIpAddr(ServletActionContext.getRequest().getRemoteAddr()); 
		// 发表时间，当前时间
		topic.setPostTime(new Date()); 

		// 保存
		topicService.save(topic);

		return "toShow"; // 转到新主题的显示页面
	}

	//0普通帖
	//1精华帖
	//2置顶帖
	//设置帖子类型
	public String setType(){
		Topic t=topicService.getById(topic.getId());
		t.setType(topic.getType());
		topicService.update(t);
		return show();
	}
	
	public String delete(){
		topicService.delete(topic.getId());
		return "delete";
	}
	@Override
	public Topic getModel() {
		return topic;
	}

	public Long getForumId() {
		return forumId;
	}

	public void setForumId(Long forumId) {
		this.forumId = forumId;
	}

	public ForumManageService getForumManageService() {
		return forumManageService;
	}

	public void setForumManageService(ForumManageService forumManageService) {
		this.forumManageService = forumManageService;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	public ReplyService getReplyService() {
		return replyService;
	}

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

}
