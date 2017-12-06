package com.oa.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import org.junit.Test;

public class MailTest {
	@Test
	public void send() throws MessagingException {

		Properties prop = new Properties();
		prop.setProperty("mail.host", "smtp.qq.com");
		prop.setProperty("mail.smtp.auth", "true");

		// 声明用户名和密码
		//qq邮箱需要开启smtp服务器,在qq邮箱里设置,开启后需要一个独立密码,在验证时用独立密码即可,不用输入qq邮箱密码
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				PasswordAuthentication pa = new PasswordAuthentication(
						"79712553", "911004zzl");
				return pa;
			}
		};

		// 声明信息
		Session session = Session.getDefaultInstance(prop, auth);
		session.setDebug(true);
		MimeMessage mimeMessage = new MimeMessage(session);

		mimeMessage.setSubject("subject覆盖");
		mimeMessage.setContent("邮件内容等等sssssss", "text/html;charset=UTF-8");
		
        try {
        	
        	//设置邮件接收方显示的时间
        	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			mimeMessage.setSentDate(format.parse("2015-3-6"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 设置发件人
		Address from = new InternetAddress("79712553@qq.com");
		mimeMessage.setFrom(from);

		// 设置收件人
		mimeMessage.setRecipient(RecipientType.TO, new InternetAddress(
				"zzlabc@foxmail.com"));
		Transport.send(mimeMessage);
	}
}
