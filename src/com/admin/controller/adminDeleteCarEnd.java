package com.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;

/**
 * Servlet implementation class adminDeleteCarEnd
 */
@WebServlet("/admin/DeleteCarEnd")
public class adminDeleteCarEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDeleteCarEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int No=Integer.parseInt(request.getParameter("carNo"));
		int result=new AdminService().DeleteCarsel(No);
		
		String msg="";
		if(result>0) {
			msg="삭제에 성공하였습니다";

		}else {
			msg="삭제에 실패하였습니다";

		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/admin/deleteCar");
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
