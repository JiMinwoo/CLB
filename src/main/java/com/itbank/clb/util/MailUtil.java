package com.itbank.clb.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itbank.clb.DAO.MemberDAO;


@Component
public class MailUtil {
	
	@Autowired
	private MemberDAO mDao;
	
	private class MyAuthenticator extends Authenticator {
		private String id;
		private String pwd;
		public MyAuthenticator(String id, String pwd) {
			this.id = id;
			this.pwd = pwd;
		}
		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
			return new javax.mail.PasswordAuthentication(id, pwd);
		}
	}
	
	private static String adminId = "jmw492@gmail.com";
	private static String adminPwd = "alsdn492!";
	private static Properties p = System.getProperties();
	private MimeMessage msg = null;
	static {
		p.put("mail.smtp.starttls.enable", "true");	
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.port", "587");
	}
	
	public MailUtil() {
		Session session = Session.getDefaultInstance(p, new MyAuthenticator(adminId, adminPwd));
		msg = new MimeMessage(session);
	}
	
	//
	public StringBuffer numSend(String receiver) throws MessagingException, UnsupportedEncodingException {
		
		try {
				final char[] pool =
		 			{'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F',
		    		'G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V',
		    		'W','X','Y','Z'};
		
				final int cnt = pool.length;
		
				Random rnd = new Random();
				
				StringBuffer code = new StringBuffer(16);
				
				for (int i= 4; i > 0; i--) {
					code.append(pool[rnd.nextInt(cnt)]);
				}
				
				System.out.println(code);
				
				String sender = "jmw492@gmail.com";
				String subject = "안녕하세요. CLB입니다!"; 
				String content = "인증번호에" + code + "를 입력해주세요.";
				
				msg.setSentDate(new Date());
				InternetAddress from = new InternetAddress(sender);
				msg.setFrom(from);
				InternetAddress to = new InternetAddress(receiver);
				InternetAddress[] toList = { to };
				msg.setRecipients(Message.RecipientType.TO,  toList);
				msg.setSubject(subject);
				//msg.setSubject(subject,"UTF-8");
				msg.setSubject(MimeUtility.encodeText(subject, "UTF-8","B"));
				msg.setContent(content,  "text/html;charset=utf-8");
				javax.mail.Transport.send(msg);
				
				return code;
			
			}
		
			catch(Exception e){
				
				e.printStackTrace();
			
				return null;
			}
	}
	
	public void findID(String findID,String receiver) throws MessagingException, UnsupportedEncodingException {
		
		try {
				
				String sender = "jmw492@gmail.com";
				String subject = "안녕하세요. CBC입니다."; 
				String content = "회원님의 아이디는 " + findID + "입니다!";
				
				msg.setSentDate(new Date());
				InternetAddress from = new InternetAddress(sender);
				msg.setFrom(from);
				InternetAddress to = new InternetAddress(receiver);
				InternetAddress[] toList = { to };
				msg.setRecipients(Message.RecipientType.TO,  toList);
				msg.setSubject(subject);
				//msg.setSubject(subject,"UTF-8");
				msg.setSubject(MimeUtility.encodeText(subject, "UTF-8","B"));
				msg.setContent(content,  "text/html;charset=utf-8");
				javax.mail.Transport.send(msg);
			
			}
		
			catch(Exception e){
				
				e.printStackTrace();
			
			}
	}
}