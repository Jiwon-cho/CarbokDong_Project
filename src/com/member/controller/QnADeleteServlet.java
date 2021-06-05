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
 * Servlet implementation class QnADelteServlet
 */
@WebServlet("/member/QnADelete")
public class QnADeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnADeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rename=request.getParameter("rename");
		int QnANo=Integer.parseInt(request.getParameter("QnANo"));
		int result=new MemberService().deleteQnA(QnANo);
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제를 성공하였습니다";
			String path=getServletContext().getRealPath("/upload/QnA/");
			File f=new File(path+rename);
			if(f.exists()) {
				f.delete();
			}
			loc="/member/QnAList";
		}else {
			msg="삭제를 실패하였습니다";
			loc="/member/QnAView?QnANo="+QnANo;
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
