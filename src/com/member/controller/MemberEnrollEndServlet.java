package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.AESEncrypt;
import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet(name = "enrollMember", urlPatterns = "/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		//클라이언트가 보낸 데이터를 가져와 DB에 저장하는 서비스!
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String nikname=request.getParameter("nikname");
		String email=request.getParameter("email");
		int memberType=Integer.parseInt(request.getParameter("memberType"));
		int cpNb=Integer.parseInt(request.getParameter("cpNb"));
		try {
			email=AESEncrypt.encrypt(email);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		String phone=request.getParameter("phone");
		try {
			phone=AESEncrypt.encrypt(phone);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String address=request.getParameter("address");
		String[] hobby=request.getParameterValues("hobby");
		
		Member m=new Member(userId,password,userName,gender,nikname,age,email,phone,address,memberType,cpNb);
	
		int result=new MemberService().insertMember(m);
		
		//클라이언트에게 보여준 페이지 선택!
		String msg="";
		String loc="";
		if(result>0) {
			//회원가입 성공
			msg="회원가입 성공!";
			loc="/";
		}else {
			//실패!
			msg="회원가입 실패";
			loc="/enrollMember";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
