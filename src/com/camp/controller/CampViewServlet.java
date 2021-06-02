package com.camp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camp.model.vo.Camp;

/**
 * Servlet implementation class CampViewServlet
 */
@WebServlet("/map/CampView")
public class CampViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CampViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String campName = request.getParameter("campName");
		
		
		request.getRequestDispatcher("/views/map/campView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
