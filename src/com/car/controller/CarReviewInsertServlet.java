package com.car.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.borad.model.service.BoardService;
import com.car.model.service.CarService;
import com.car.model.vo.Reviews;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class CarReviewInsertServlet
 */
@WebServlet("/car/insertReview")
public class CarReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarReviewInsertServlet() {
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
			request.setAttribute("loc", "/car/carList");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
	
		String path=getServletContext().getRealPath("/upload/car/");
		System.out.println(path);
		int maxSize=1024*1024*100;
		String encode="UTF-8";
		FileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
				encode,policy);
		Reviews r= new Reviews();
		
		r.setRating(Integer.parseInt(mr.getParameter("rating")));
		r.setFileName(mr.getFilesystemName("filename"));
		r.setReviewContents(mr.getParameter("content"));
		r.setMemberId(mr.getParameter("memberId"));
		r.setCarNb(Integer.parseInt(mr.getParameter("carNo")));
		
		int result=new CarService().insertReviews(r);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="리뷰 등록이 완료되었습니다.";
			loc="/car/carView?carNB="+r.getCarNb();
			
		}else {
			msg="리뷰 등록에 실패하였습니다.다시 한번 시도해주세요.";
			loc="/car/carView?carNB="+r.getCarNb();
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
