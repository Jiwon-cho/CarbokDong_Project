package com.borad.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.borad.model.service.BoardService;
import com.borad.model.vo.Board;
import com.borad.model.vo.Files;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/boardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			//잘못된 요청으로 에러처리함.
			request.setAttribute("msg","작성오류관리자에게 문의하세요 X(");
			request.setAttribute("loc", "/borad/mainBorad");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
		

		
		String path=getServletContext().getRealPath("/upload/board/");
		System.out.println(path);
		int maxSize=1024*1024*100;
		String encode="UTF-8";
		FileRenamePolicy policy=new DefaultFileRenamePolicy();

		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
				encode,policy);
		
		Board b=new Board();
		b.setBoardTitle(mr.getParameter("title"));
		b.setBoardContents(mr.getParameter("content"));
		b.setMemberId(mr.getParameter("id"));
		
		
		
		//String title=request.getParameter("title");
		//String content=request.getParameter("content");
		//String id=request.getParameter("id");
		int result=new BoardService().WriteBorad(b);

		ArrayList<String> originFiles = new ArrayList<String>();
		Enumeration<String> files = mr.getFileNames();
		while(files.hasMoreElements()) {
   
      
            String name = files.nextElement();
            
            if(mr.getFilesystemName(name) != null) {
            	// getFilesystemName(key) : rename된 파일명 얻어오기
                originFiles.add(mr.getOriginalFileName(name));
            }
        }
		ArrayList<Files> fList = new ArrayList<Files>();
		 for(int i = originFiles.size()-1; i>=0; i--) {
			Files f= new Files();
			f.setFileNm(originFiles.get(i));
			int num=new BoardService().FileNoSelect(b);
			int re=new BoardService().insertFile(f,num);
		}
		
		String ss=mr.getFilesystemName("files");
		System.out.println(ss);
	
		
		
		
		
		
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시물 등록이 완료되었습니다.";
			loc="/borad/mainBorad";
			
		}else {
			msg="등록에 실패하였습니다.다시 한번 시도해주세요.";
			loc="/insertBorad";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
