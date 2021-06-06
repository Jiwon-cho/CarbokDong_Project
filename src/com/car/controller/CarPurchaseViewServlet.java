package com.car.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.car.model.service.CarService;
import com.car.model.vo.Car;
import com.common.AESEncrypt;
import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class CarPurchaseViewServlet
 */
@WebServlet("/car/carPurchaseView")
public class CarPurchaseViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarPurchaseViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int carNB=Integer.parseInt(request.getParameter("carNB"));

		
		//암호화된 자료를 복호화처리
		
		
		List<String> carpics=new CarService().selectCarPics(carNB);
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		String gear=request.getParameter("gear")!=null?request.getParameter("gear"):"";		
		String gn=null;
		int g=0;
		switch(gear) {
		case "grill" : g=2000;gn="바베큐그릴";break ;
		}
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		long calDate=0;
		long calDateDays=0;
	try {
		Date startd=sdf.parse(start);
		Date endd=sdf.parse(end);
		
		calDate=startd.getTime()-endd.getTime();
		
		calDateDays=Math.abs(calDate/(24*60*60*1000));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
		Car c=new CarService().selectCar(carNB);
		
		int money=c.getPrice()*(int)calDateDays+g;
		

		request.setAttribute("carpics", carpics);
		request.setAttribute("car", c);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		//request.setAttribute("days", calDateDays);
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
