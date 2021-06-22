package com.car.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.car.model.service.CarService;
import com.car.model.vo.Cart;

/**
 * Servlet implementation class GotoCartServlet
 */
@WebServlet("/car/gotoCart")
public class GotoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
    			
		int carNB=Integer.parseInt(request.getParameter("carNB"));
		int money=Integer.parseInt(request.getParameter("money"));
		String start=request.getParameter("start");
		String end=request.getParameter("end");
		String gear=request.getParameter("gear")!=null?request.getParameter("gear"):"";		
		String gn=null;
		String id=request.getParameter("id");
		int g=0;
		switch(gear) {
		case "grill" : g=2000;gn="바베큐그릴";break ;
		}
		money=money+g;
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		Date startd=null;
		Date endd=null;
		try {
			startd=sdf.parse(start);
			endd=sdf.parse(end);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		Cart c=new Cart();
		c.setProductNb(carNB);
		c.setRent_start_date(startd);
		c.setRent_end_date(endd);
		c.setMemberId(id);
		c.setCartPrice(money);
		c.setGear(gn);
		
		int result=new CarService().insertCart(c);
		String msg="";
		if(result>0) {
			msg+="장바구니에 추가되었습니다.";
		}else {
			msg+="장바구니에 담지 못하였습니다.";
		}
		
		response.getWriter().write(msg);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
