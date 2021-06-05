package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;
import com.car.model.vo.Car;

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
		String type=request.getParameter("carType");
		String model=request.getParameter("carModel");
		int ppl=Integer.parseInt(request.getParameter("carPPL"));
		int total=Integer.parseInt(request.getParameter("carTotal"));
		int psg=Integer.parseInt(request.getParameter("carPSG"));
		String info=request.getParameter("carInfo");
		int price=Integer.parseInt(request.getParameter("carPrice"));
		Car c=new Car();
		c.setCarType(type);
		c.setCarModel(model);
		c.setCarPpl(ppl);
		c.setCarTotal(total);
		c.setCarPsb(psg);
		c.setCarInfo(info);
		c.setPrice(price);
		int result=new AdminService().insertCarsel(c);
		
		String msg="";
		if(result>0) {
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
