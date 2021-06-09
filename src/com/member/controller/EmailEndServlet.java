package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmailEndServlet
 */
@WebServlet("/member/emailEnd")
public class EmailEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int random=Integer.parseInt(request.getParameter("random"));
		int result=Integer.parseInt(request.getParameter("code"));
		String msg="";
		String loc="";
		if(random==result) {
			HttpSession session=request.getSession(false);
	    	if(session!=null) {
	    		session.removeAttribute("random");
	    	}
			msg="이메일 인증성공!";
			loc="/";
			request.setAttribute("script","window.close();");
			request.setAttribute("emailresult", "Y");
		}else {
			msg="이메일 인증실패!";
			loc="/views/member/email.jsp";
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
