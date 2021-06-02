package com.borad.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.borad.model.service.BoardService;

/**
 * Servlet implementation class BoardReplyDeleteServlet
 */
@WebServlet("/board/deleteReply")
public class BoardReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int reNo=Integer.parseInt(request.getParameter("reNo"));
		int boNo=Integer.parseInt(request.getParameter("boNo"));
		int result=new BoardService().DeleteReply(reNo);
		
		String msg="";
		if(result>0) {
			msg="삭제되었습니다.";
		}else {
			msg="삭제에 실패하였습니다.";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", "/borad/boardView?No="+boNo);
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
