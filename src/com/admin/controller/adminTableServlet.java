package com.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.service.AdminService;
import com.borad.model.service.BoardService;
import com.camp.model.vo.Camp;
import com.car.model.vo.Car;
import com.common.AESEncrypt;
import com.member.model.vo.Member;

/**
 * Servlet implementation class adminTableServlet
 */
@WebServlet("/adminTableServlet")
public class adminTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Member>mlist=new AdminService().selectMemberList();
		for(Member m : mlist) {
			try {
				m.setEmail(AESEncrypt.decrypt(m.getEmail()));
			}catch(Exception e) {
				
			}
		}
		//List<Car>clist=new BoardService().selectCarList();
		//request.setAttribute("clist", clist);
		//List<Camp>camlist=new BoardService().selectCampList();
		
		
		//request.setAttribute("camlist", camlist);
		
		request.setAttribute("mlist", mlist);
		request.getRequestDispatcher("/views/admin/adminTable.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
