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
		String userId=request.getParameter("userId");
		String userName=request.getParameter("userName");
		String email=(request.getParameter("email1")+"@"+request.getParameter("email2"));
		try {
			email=AESEncrypt.encrypt(email);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		String password=request.getParameter("password");
		String address=(request.getParameter("sample4_jibunAddress")+"/"+request.getParameter("sample4_postcode")+"/"+request.getParameter("sample4_roadAddress")+"/"+request.getParameter("address"));
		String nikname=request.getParameter("nikName");
		String userNo2=(request.getParameter("userNo2"));
		char userNo=userNo2.charAt(0);
		System.out.println(userNo);
		String gender="";
		if(userNo=='1' || userNo=='3') {gender="M";}
		else {gender="F";}
		int memberType=Integer.parseInt(request.getParameter("memberType"));
		
		Member m=new Member(userId,userName,email,address,nikname,gender,memberType,password);
		
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
