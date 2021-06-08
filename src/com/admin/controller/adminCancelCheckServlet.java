package com.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.admin.model.service.AdminService;

/**
 * Servlet implementation class adminCancelCheckServlet
 */
@WebServlet("/payment/cancelCheck")
public class adminCancelCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminCancelCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pn=request.getParameter("pm_no");
		int a=new AdminService().updateCancel(pn);
		String rc=new AdminService().cancelCheck(pn);
		String msg="";
		if(rc.equals("N")) {
			msg+="취소 신청이 접수되었습니다.";
		}else {
			msg+="오류 발생";
		}
		
		   JSONObject jo=new JSONObject();
		  jo.put("rc", rc);
		  jo.put("msg",msg);
		  System.out.println(jo);
		  
		  
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
