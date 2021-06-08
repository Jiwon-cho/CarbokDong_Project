package com.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.admin.model.service.AdminService;
import com.payment.model.vo.Payment;

/**
 * Servlet implementation class adminReturnCheckServlet
 */
@WebServlet("/admin/returnCheck")
public class adminReturnCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminReturnCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pm_no=request.getParameter("pm_no");
		
		int a=new AdminService().rentalEnd(pm_no);
		List<Payment> list=new AdminService().selectPayments();
		int b=0;
		for(Payment p:list) {
			if(p.getPaymentsNo().equals(pm_no)) {
				b=p.getProductNb();
			}
		}
		
		int c=new AdminService().addCar(b);
		String rc=new AdminService().returnCheck(pm_no);
		
		
		
		  String msg=""; if(a>0&&c>0) { msg+="반납이 확인되었습니다"; }else {
		 msg+="반납에 실패하였습니다."; }
		  
		  
		  JSONObject jo=new JSONObject();
		  jo.put("rc", rc);
		  jo.put("msg",msg);
		  
		  
		  response.getWriter().print(jo);
		 
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
