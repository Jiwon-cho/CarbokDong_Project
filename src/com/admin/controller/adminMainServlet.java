package com.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;

/**
 * Servlet implementation class adminMainServlet
 */
@WebServlet("/admin/adminMain")
public class adminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int mCount=new AdminService().selectMemberCount();
		int cCount=new AdminService().selectCarCount();
		int camCount=new AdminService().selectCampingCount();
		int qCount=new AdminService().selectQcount();
		
		
		TreeMap<Date,Integer> graphmember=new AdminService().selectGraphMember();
		System.out.println(graphmember);
		List<Date> gdate=new ArrayList<Date>();
		List<Integer> gcount=new ArrayList<Integer>();
		
		for(Date d: graphmember.keySet()) {
			gdate.add(d);
			gcount.add(graphmember.get(d));
		}
		
		List<Integer> pie=new AdminService().carPercentage();
		System.out.println(pie);
		
		request.setAttribute("qcount", qCount);
		request.setAttribute("pie", pie);
		request.setAttribute("gcount", gcount);
		request.setAttribute("gdate", gdate);
		request.setAttribute("mCount", mCount);
		request.setAttribute("cCount", cCount);
		request.setAttribute("camCount", camCount);
		request.getRequestDispatcher("/views/admin/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
