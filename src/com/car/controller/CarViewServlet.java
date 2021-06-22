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
import com.car.model.vo.Reviews;

/**
 * Servlet implementation class CarViewServlet
 */
@WebServlet("/car/carView")
public class CarViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarViewServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int carNB=Integer.parseInt(request.getParameter("carNB"));
		
		Car c=new CarService().selectCar(carNB);
		List<String> carpics=new CarService().selectCarPics(carNB);
		
		List<Reviews>rlist=new CarService().selectReviewList(carNB);
		
		
		request.setAttribute("car", c);
		request.setAttribute("rlist", rlist);
		request.setAttribute("carpics", carpics);
		
		
		request.getRequestDispatcher("/views/Car/carViews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		/*
		 * String carNB=request.getParameter("carNb");
		 * 
		 * HttpSession session=request.getSession(); session.setAttribute("carNB",
		 * carNB);
		 * response.sendRedirect(request.getContextPath()+"/views/Car/carViews.jsp");
		 */
//		request.getRequestDispatcher("/views/Car/carViews.jsp").forward(request, response);
	}

}
