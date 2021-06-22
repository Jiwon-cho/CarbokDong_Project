package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class NaverLoginServlet
 */
@WebServlet("/naverLogin")
public class NaverLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String nickname=request.getParameter("nickname");
		Member n=new Member(email,"","","",nickname,"",3,"");
		Member chake=new MemberService().chakeNaver(email);
		if(chake==null) {
			int result=new MemberService().insertNaverMemver(email,nickname);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", n);
		request.setAttribute("loc", "/");
		request.setAttribute("script","window.close();");
		//response.sendRedirect(request.getContextPath()+"/");
		request.getRequestDispatcher("/views/member/NaverLoginCollback.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
