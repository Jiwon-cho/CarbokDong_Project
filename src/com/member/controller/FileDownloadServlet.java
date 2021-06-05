package com.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/member/filedownload")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rename=request.getParameter("rename");
		String oriname=request.getParameter("oriname");
		
		String path=getServletContext().getRealPath("/upload/QnA/");
		
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(path+rename));
		
		String header=request.getHeader("user-agent");
		boolean isMS=header.contains("Trident")||header.contains("MSIE");
		String reFileName="";
		if(isMS) {
			reFileName=URLEncoder.encode(oriname,"utf-8");
			reFileName=reFileName.replace("\\+", "%20");
		}else {
			reFileName=new String(oriname.getBytes("utf-8"),"ISO-8859-1");
		}
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+reFileName);
		
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
		
		int read=-1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bis.close();
		bos.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
