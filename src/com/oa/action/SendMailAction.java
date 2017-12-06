package com.oa.action;

import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.MyMail;
import com.oa.pojo.User;
import com.oa.service.SendMailService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SendMailAction extends ActionSupport implements ModelDriven<MyMail>{

	private SendMailService sendMailService;
	private MyMail myMail=new MyMail();
	
	public String add(){
		return "add";
	}
	
	public String send() throws MessagingException{
		String server="smtp."+(myMail.getMailFrom().split("@"))[1];
		Properties prop = new Properties();
		prop.setProperty("mail.host", server);
		prop.setProperty("mail.smtp.auth", "true");

		// 声明用户名和密码
		//qq邮箱需要开启smtp服务器,在qq邮箱里设置,开启后需要一个独立密码,在验证时用独立密码即可,不用输入qq邮箱密码
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				PasswordAuthentication pa = new PasswordAuthentication(
						myMail.getUserName(), myMail.getPassword());
				return pa;
			}
		};

		// 声明信息
		Session session = Session.getDefaultInstance(prop, auth);
		session.setDebug(true);
		MimeMessage mimeMessage = new MimeMessage(session);

		mimeMessage.setSubject(myMail.getSubject());
		mimeMessage.setContent(myMail.getContent(), "text/html;charset=UTF-8");
		

		// 设置发件人
		Address from = new InternetAddress(myMail.getMailFrom());
		mimeMessage.setFrom(from);

		// 设置收件人
		mimeMessage.setRecipient(RecipientType.TO, new InternetAddress(
				myMail.getMailTo()));
		Transport.send(mimeMessage);
		myMail.setServer(server);
		User u=(User) ServletActionContext.getRequest().getSession().getAttribute("user");

		myMail.setUser(u);
		//保存邮件
		sendMailService.save(myMail);
		
		return mailList();
	}
	
	public String mailList(){
		
		List<MyMail> mailList=sendMailService.findAll();
		ActionContext.getContext().put("mailList",mailList);
		return "mailList";
	}

	@Override
	public MyMail getModel() {
		return myMail;
	}

	public SendMailService getSendMailService() {
		return sendMailService;
	}

	public void setSendMailService(SendMailService sendMailService) {
		this.sendMailService = sendMailService;
	}
	
}
