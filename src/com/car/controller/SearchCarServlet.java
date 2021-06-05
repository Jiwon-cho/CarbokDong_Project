package com.car.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.car.model.service.CarService;
import com.car.model.vo.Car;

/**
 * Servlet implementation class SearchCarServlet
 */
@WebServlet("/car/searchCar")
public class SearchCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String carType=request.getParameter("carType");
		List<Car> list=new CarService().searchCar(carType);
		
		
		/*
		 * String csv=""; for(int i=0;i<list.size();i++) { if(i!=0) csv+="\n";
		 * csv+=list.get(i);
		 * 
		 * } response.setContentType("text/csv;charset=utf-8");
		 * response.getWriter().print(csv);
		 */
		
		
		  request.setAttribute("list", list);
		  
		  request.getRequestDispatcher("/views/Car/Carlist.jsp").forward(request,
		  response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
