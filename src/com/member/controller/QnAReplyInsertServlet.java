package com.member.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.QnAReply;

/**
 * Servlet implementation class QnAReplyInsertServlet
 */
@WebServlet("/member/insertReply")
public class QnAReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String qnAReplyContent=request.getParameter("QnAReplyContent");
		int qnANb=Integer.parseInt(request.getParameter("QnAReply"));
		
		QnAReply qr=new QnAReply(0,qnAReplyContent,null,qnANb);
		
		int result=new MemberService().insertQnAReply(qr);
		String msg="";
		if(result>0) {
			msg="댓글등록성공";
		}else {
			msg="댓글등록실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/member/QnAView?QnANo="+qnANb);
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
