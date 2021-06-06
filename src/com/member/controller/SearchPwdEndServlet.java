package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.AESEncrypt;
import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class SearchPwdEndServlet
 */
@WebServlet("/member/searchPwdEnd")
public class SearchPwdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=request.getParameter("userId");
		String name = request.getParameter("name");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		try {
			email=AESEncrypt.encrypt(email);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		Member m = new MemberService().searchPwd(userId,name, email);
		
		if (m != null) {

			HttpSession session = request.getSession();
			session.setAttribute("searchPwd", m);
			
			request.getRequestDispatcher("/views/member/searchPasswordResult.jsp").forward(request, response);
				
		} else {
			String msg = "정보가 존재하지 않습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/views/member/searchPassword.jsp");

			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
