package com.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/member/email")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int random = 0;
		random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
		String user = "xodns13131";       // 구글 ID
        String password = "1357xoxo@";
		 Properties props = System.getProperties();
	        //props.put("mail.smtp.user", ""); // 서버 아이디만 쓰기
			props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
//			props.put("mail.smtp.port", "465");
//			props.put("mail.smtp.starttls.enable", "true");
//			props.put("mail.smtp.auth", "true");
//			props.put("mail.smtp.socketFactory.port", "465");
//			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	           
	        //Authenticator auth = new MyAuthentication();
	         
	        //session 생성 및  MimeMessage생성
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	        	protected PasswordAuthentication getPasswordAuthentication() { 
	        		return new PasswordAuthentication(user, password); 
	        		} 
	        	});

	        String email1=request.getParameter("email1");
        	String email2=request.getParameter("email2");
	         
	        try{
	        	MimeMessage msg = new MimeMessage(session);
	            //편지보낸시간
//	            msg.setSentDate(new Date());
//	             
//	            InternetAddress from = new InternetAddress("카복동") ;             
//
//	            // 이메일 발신자
//	            msg.setFrom(from);           
//	             
//	            // 이메일 수신자
	        	
	            String email = email1+"@"+email2; //사용자가 입력한 이메일 받아오기
//	            InternetAddress to = new InternetAddress(email);
//	            msg.setRecipient(Message.RecipientType.TO, to);
//	             
//	            // 이메일 제목
//	            msg.setSubject("회원가입 인증번호", "UTF-8");
//	             
//	            // 이메일 내용 
//
	            //String code = request.getParameter("code_check"); //인증번호 값 받기
	            HttpSession session2 = request.getSession();
				session2.setAttribute("random", random);
	            //request.setAttribute("random", random);
//	            msg.setText(code, "UTF-8");
//	             
//	            // 이메일 헤더 
//	            msg.setHeader("content-Type", "text/html");
//	             
//	            //메일보내기
//	            javax.mail.Transport.send(msg);
//	            System.out.println("보냄!");
	        	msg.setFrom(new InternetAddress(user));

	            //수신자메일주소
	            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

	            // Subject
	            msg.setSubject("카복동 회원가입 인증번호"); //메일 제목을 입력

	            // Text
	            msg.setText("인증번호 : "+random);    //메일 내용을 입력

	            // send the message
	            Transport.send(msg); ////전송

	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	    
	        RequestDispatcher rd = request.getRequestDispatcher("/views/member/email.jsp");
	        rd.forward(request, response);
	}

	class MyAuthentication extends Authenticator {
	      
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "xodns13131";       // 구글 ID
	        String pw = "1357xoxo@";          // 구글 비밀번호
	 
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    // 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
