package com.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.QnA;
import com.member.model.vo.QnAReply;

/**
 * Servlet implementation class QnAViewServlet
 */
@WebServlet("/member/QnAView")
public class QnAViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int QnANo=Integer.parseInt(request.getParameter("QnANo"));
		QnA q=new MemberService().selectQnA(QnANo);
		
		List<QnAReply> reply=new MemberService().selectQnAReply(QnANo);
		
		request.setAttribute("reply", reply);
		String view="";
		if(q==null) {
			request.setAttribute("msg","조회된 게시물이 삭제되었습니다");
			request.setAttribute("loc", "/member/QnAList");
			view="/views/common/msg.jsp";
		}else {
			request.setAttribute("QnA", q);
			view="/views/member/QnAView.jsp";
		}
		
//		request.getRequestDispatcher("views/board/boardView.jsp").forward(request, response);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
