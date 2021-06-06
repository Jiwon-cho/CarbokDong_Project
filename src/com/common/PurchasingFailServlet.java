package com.common;

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
 * Servlet implementation class PurchasingFailServlet
 */
@WebServlet("/order/payFail")
public class PurchasingFailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchasingFailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String referer = request.getParameter("referer");
		int carNB=Integer.parseInt(request.getParameter("carNB"));
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		int money=Integer.parseInt(request.getParameter("money"));
		String gear=request.getParameter("gear")!=null?request.getParameter("gear"):"";		
		String gn=null;
		int g=0;
		switch(gear) {
		case "grill" : g=2000;gn="바베큐그릴";break ;
		}
		Car c=new CarService().selectCar(carNB);
		List<String> carpics=new CarService().selectCarPics(carNB);
		
		
		request.setAttribute("carpics", carpics);
		request.setAttribute("car", c);
		request.setAttribute("start", start);
		request.setAttribute("end", end); 
		//request.setAttribute("referer", referer);
		request.setAttribute("gear", gn);
		request.setAttribute("gearprice", g);
		request.setAttribute("money", money);
		request.getRequestDispatcher("/views/Car/carPurchaseView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
