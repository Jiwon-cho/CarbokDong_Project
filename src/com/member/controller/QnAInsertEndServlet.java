package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.common.MyRenameFile;
import com.member.model.service.MemberService;
import com.member.model.vo.QnA;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class QnAInsertEndServlet
 */
@WebServlet("/member/QnAInsertEnd")
public class QnAInsertEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAInsertEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 접근입니다");
			request.setAttribute("loc", "/member/QnAList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/QnA/");
		MultipartRequest mr=new MultipartRequest(request, path,1024*1024*200,"utf-8",new MyRenameFile());
//		MultipartRequest mr=new MultipartRequest(request, path,1024*1024*200,"utf-8",new DefaultFileRenamePolicy());
		QnA q=new QnA();
		q.setTitle(mr.getParameter("title"));
		q.setContent(mr.getParameter("content"));
		q.setUserId(mr.getParameter("writer"));
		q.setFileOriginalName(mr.getOriginalFileName("upfile"));
		q.setFileReName(mr.getFilesystemName("upfile"));
		q.setQapublic(mr.getParameter("public"));
		q.setNickName(mr.getParameter("nickname"));
		int result=new MemberService().insertQnA(q);
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시글이 등록되었습니다.";
		}else {
			msg="게시글 등록을 실패하였습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/member/QnAList");
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
