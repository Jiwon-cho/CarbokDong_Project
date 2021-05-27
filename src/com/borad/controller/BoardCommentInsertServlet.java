package com.borad.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.borad.model.service.BoardService;
import com.borad.model.vo.BoardComment;

/**
 * Servlet implementation class BoardCommentInsertServlet
 */
@WebServlet("/board/commentInsert")
public class BoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comment=request.getParameter("comment");
		int level=Integer.parseInt(request.getParameter("level"));
		String commentWriter=request.getParameter("commentWriter");
		int boardRef=Integer.parseInt(request.getParameter("boardRef"));
		int commentRef=Integer.parseInt(request.getParameter("commentRef"));
		
		
		BoardComment bc=new BoardComment(0,level,commentWriter,comment,boardRef,commentRef,null);
		
		int result=new BoardService().insertBoardComment(bc);
		String msg="";
		if(result>0) {
			msg="댓글등록성공";
		}else {
			msg="댓글등록실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/borad/boardView?No="+boardRef);
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
