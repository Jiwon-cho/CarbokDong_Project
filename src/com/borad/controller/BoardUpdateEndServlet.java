package com.borad.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.borad.model.service.BoardService;

/**
 * Servlet implementation class BoardUpdateEndServlet
 */
@WebServlet("/board/updateEnd")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int No=Integer.parseInt(request.getParameter("No"));
		int result=new BoardService().updateBoard(title,content,No);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="수정에 성공하였습니다.";
			loc="/borad/mainBorad";
		}else {
			msg="게시글 수정에 실패하였습니다,다시한번 시도해주세요";
			loc="/borad/mainBorad";
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
