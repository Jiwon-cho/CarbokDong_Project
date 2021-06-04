package com.member.controller;

import java.io.File;
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
 * Servlet implementation class QnAUpdateEndServlet
 */
@WebServlet("/member/QnAUpdateEnd")
public class QnAUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int QnANo=Integer.parseInt(request.getParameter("QnANo"));
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","공지사항 수정실패 [form:enctype] X(");
			request.setAttribute("loc", "/member/QnAList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/QnA/");
		MultipartRequest mr=new MultipartRequest(request, path,1024*1024*200,"utf-8",new MyRenameFile());
		
		QnA q=new QnA();
		q.setContent(mr.getParameter("content"));
		q.setTitle(mr.getParameter("title"));
		q.setQapublic(mr.getParameter("public"));
		String ReName=mr.getFilesystemName("up_file");
		String OriginalName=mr.getOriginalFileName("up_file");
		File f=mr.getFile("up_file");
		if(f!=null&&f.length()>0) {
			File del=new File(path+mr.getParameter("oldFile"));
			del.delete();
		}else {
			ReName=mr.getFilesystemName("oldFile");
			OriginalName=mr.getOriginalFileName("oldFile");
		}
		q.setFileOriginalName(OriginalName);
		q.setFileReName(ReName);
		
		int result=new MemberService().updateQnA(q,QnANo);
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시글이 수정되었습니다.";
			loc="/member/QnAView?QnANo="+QnANo;
		}else {
			msg="게시글 수정을 실패하였습니다.";
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
