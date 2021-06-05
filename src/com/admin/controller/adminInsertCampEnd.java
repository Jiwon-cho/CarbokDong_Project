package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;
import com.camp.model.vo.Camp;

/**
 * Servlet implementation class adminInsertCampEnd
 */
@WebServlet("/admin/insertCampEnd")
public class adminInsertCampEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminInsertCampEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("campName");
		String loc=request.getParameter("campLoc");
		String info=request.getParameter("campInfo");
		double lat=Double.parseDouble(request.getParameter("campLAT"));
		double calong=Double.parseDouble(request.getParameter("campLong"));
		int price=Integer.parseInt(request.getParameter("campPrice"));
		String fa=request.getParameter("campFA");
		Camp c=new Camp();
		c.setName(name);
		c.setLocation(loc);
		c.setInfo(info);
		c.setLatitude(lat);
		c.setLongitude(calong);
		c.setPrice(price);
		c.setFacility(fa);
		
		int result=new AdminService().insertCampsel(c);
		
		String msg="";
		if(result>0) {
			msg="입력에 성공하였습니다";

		}else {
			msg="입력에 실패하였습니다";

		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/admin/insertCamp");
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
