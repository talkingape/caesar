package edu.sdut.util;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class MailUtil {

	public static void sendTextMail(String smtpHostName, String userName, String passWord, String toAddress,
			String subject, String context) throws Exception {
		Properties prop = new Properties();
		prop.setProperty("mail.host", smtpHostName);
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		// 使用JavaMail发送邮件的5个步骤
		// 1、创建session
		Session session = Session.getInstance(prop);
		// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		session.setDebug(true);
		// 2、通过session得到transport对象
		try {
			Transport ts = session.getTransport();
			// 3、连上邮件服务器，需要发件人提供邮箱的用户名和密码进行验证
			ts.connect(smtpHostName, userName, passWord);
			// 4、创建邮件
			Message message = createImageMail(session, userName, toAddress, subject, context);
			// 5、发送邮件
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method: createImageMail
	 * @Description: 生成一封邮件正文带图片的邮件
	 *
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public static MimeMessage createImageMail(Session session, String userName, String toAddress, String subject,
			String context) throws Exception {
		// 创建邮件
		MimeMessage message = new MimeMessage(session);
		// 设置邮件的基本信息
		// 发件人
		message.setFrom(new InternetAddress(userName));
		// 收件人
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
		// 邮件标题
		message.setSubject(subject);
		// 准备邮件数据
		// 准备邮件正文数据
		MimeBodyPart text = new MimeBodyPart();
		text.setContent(context, "text/html;charset=UTF-8");
		// 准备图片数据
		/*
		 * MimeBodyPart image = new MimeBodyPart(); DataHandler dh = new
		 * DataHandler(new FileDataSource("src\\1.jpg"));
		 * image.setDataHandler(dh); image.setContentID("xxx.jpg");
		 */
		// 描述数据关系
		MimeMultipart mm = new MimeMultipart();
		mm.addBodyPart(text);
		// mm.addBodyPart(image);
		mm.setSubType("related");
		message.setContent(mm);
		message.saveChanges();
		// 返回创建好的邮件
		return message;
	}
}
