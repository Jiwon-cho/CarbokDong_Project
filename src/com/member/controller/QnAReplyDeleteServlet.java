package com.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;

/**
 * Servlet implementation class QnAReplyDeleteServlet
 */
@WebServlet("/member/deleteReply")
public class QnAReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int QnAReplyNo=Integer.parseInt(request.getParameter("QnAReplyNo"));
		int QnANo=Integer.parseInt(request.getParameter("QnANo"));
		int result=new MemberService().deleteQnAReply(QnAReplyNo);
		
		String msg="";
		if(result>0) {
			msg="댓글이 삭제되었습니다.";
		}else {
			msg="댓글을 삭제하지 못했습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/member/QnAView?QnANo="+QnANo);
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
