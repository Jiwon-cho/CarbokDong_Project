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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = new Member();
		m.setUserId(request.getParameter("userId"));
		try {
			String email=request.getParameter("email1")+"@"+request.getParameter("email2");
			m.setEmail(AESEncrypt.encrypt(email));
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.setAddress((request.getParameter("sample4_jibunAddress") + "/" + request.getParameter("sample4_postcode")
				+ "/" + request.getParameter("sample4_roadAddress") + "/" + request.getParameter("address")));

		int result = new MemberService().updateMember(m);
		String msg = "";
		String loc = "";
		if (result > 0) {
			Member m1 = new MemberService().selectMemberId(request.getParameter("userId"));
			msg = "회원수정성공";
			loc = "/";
			HttpSession session = request.getSession(false);
			session.setAttribute("loginMember", m1);
		} else {
			msg = "회원수정실패";
			loc = "/member/memberView?userId=" + m.getUserId();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
