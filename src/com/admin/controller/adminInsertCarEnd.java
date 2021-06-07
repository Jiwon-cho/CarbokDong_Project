package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.admin.model.service.AdminService;
import com.borad.model.vo.Board;
import com.borad.model.vo.Files;
import com.car.model.vo.Car;
import com.car.model.vo.CarFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class adminInsertCarEnd
 */
@WebServlet("/admin/insertCarEnd")
public class adminInsertCarEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminInsertCarEnd() {
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
			request.setAttribute("loc", "/admin/insertCar");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
	
		String path=getServletContext().getRealPath("/upload/admin/");
		System.out.println(path);
		int maxSize=1024*1024*100;
		String encode="UTF-8";
		FileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest mr=new MultipartRequest(request,path,maxSize,
				encode,policy);
		CarFile f= new CarFile();
		
		f.setCarPicNb(Integer.parseInt(mr.getParameter("carNo")));
		f.setCarPicNm(mr.getFilesystemName("fileName"));
		
		
		
		Car c=new Car();
		c.setCarNB(Integer.parseInt(mr.getParameter("carNo")));
		c.setCarType(mr.getParameter("carType"));
		c.setCarModel(mr.getParameter("carModel"));
		c.setCarPpl(Integer.parseInt(mr.getParameter("carPPL")));
		c.setCarTotal(Integer.parseInt(mr.getParameter("carTotal")));
		c.setCarPsb(Integer.parseInt(mr.getParameter("carPSG")));
		c.setCarInfo(mr.getParameter("carInfo"));
		c.setPrice(Integer.parseInt(mr.getParameter("carPrice")));
		
		
		

//		int No=Integer.parseInt(request.getParameter("carNo"));
//		String type=request.getParameter("carType");
//		String model=request.getParameter("carModel");
//		int ppl=Integer.parseInt(request.getParameter("carPPL"));
//		int total=Integer.parseInt(request.getParameter("carTotal"));
//		int psg=Integer.parseInt(request.getParameter("carPSG"));
//		String info=request.getParameter("carInfo");
//		int price=Integer.parseInt(request.getParameter("carPrice"));
//		Car c=new Car();
//		c.setCarNB(No);
//		c.setCarType(type);
//		c.setCarModel(model);
//		c.setCarPpl(ppl);
//		c.setCarTotal(total);
//		c.setCarPsb(psg);
//		c.setCarInfo(info);
//		c.setPrice(price);
		int result=new AdminService().insertCarsel(c);
		int re=new AdminService().insertCarFile(f);
		String msg="";
		if(result>0&&re>0) {
			msg="입력에 성공하였습니다";

		}else {
			msg="입력에 실패하였습니다";

		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/admin/insertCar");
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
