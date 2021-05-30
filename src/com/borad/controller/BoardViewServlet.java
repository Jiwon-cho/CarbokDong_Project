package com.borad.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.borad.model.service.BoardService;
import com.borad.model.vo.Board;
import com.borad.model.vo.Reply;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/borad/boardView")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int No=Integer.parseInt(request.getParameter("No"));
	

		boolean readFlag=false;
		String boardReadNo="";
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(Cookie c: cookies) {
				String name=c.getName();
				String value=c.getValue();
				if(name.equals("boardReadNo")) {
					if(value.contains("|"+No+"|")) {
						readFlag=true;
						break;
					}
					boardReadNo=value;
				}
			}
		}
		
		if(!readFlag) {
			Cookie c=new Cookie("boardReadNo",boardReadNo+"|"+No+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		
		
		Board b=new BoardService().selectNoPage(No,readFlag);
		
		List<Reply>list=new BoardService().selectBoardComment(No);
		
		int replycount=new BoardService().selectReplyCount(No);
		
		request.setAttribute("replycount", replycount);
		request.setAttribute("list", list);
		request.setAttribute("b", b);
		request.getRequestDispatcher("/views/borad/BoardView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}