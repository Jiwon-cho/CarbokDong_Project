package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePasswordEndServlet
 */
@WebServlet(name="updatePassword",urlPatterns = "/updatePasswordEnd")
public class UpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String curPw=request.getParameter("password");
		String userId=request.getParameter("userId");
		Member m=new MemberService().login(userId,curPw);
		
		String msg="";
		String loc="";
		
		if(m==null) {
			//비밀번호 불일치
			msg="현재 비밀번호가 일치하지 않습니다!";
			loc="/member/updatePassword?userId="+userId;
			
		}else {
			//비밀번호 일치
			String newPw=request.getParameter("password_new");
			int result=new MemberService().updatePassword(userId, newPw);			
			if(result>0) {
				msg="비밀번호 수정완료";
				loc="/";
				request.setAttribute("script","window.close();");
			}else {
				msg="비밀번호 수정실패";
				loc="/member/updatePassword?userId="+userId;
				
			}
				
		}
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		
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
