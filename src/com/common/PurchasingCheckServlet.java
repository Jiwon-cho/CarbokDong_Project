package com.common;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.payment.model.service.PaymentService;
import com.payment.model.vo.Payment;

/**
 * Servlet implementation class PurchasingCheckServlet
 */
@WebServlet("/order/purchasecheck")
public class PurchasingCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchasingCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String imp_uid=request.getParameter("imp_uid");
		String merchant_uid=request.getParameter("merchant_uid");
		 int paid_amount=Integer.parseInt(request.getParameter("paid_amount"));
		 String sdate=request.getParameter("date") ;
		 System.out.println(sdate);
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
		 Date date=null;
		 try {
		 date=sdf.parse(sdate);
		}catch(Exception e){
			e.printStackTrace();
		}
		 System.out.println(date);
         String pay_method=request.getParameter("pay_method");
         String pd_name=request.getParameter("pd_name");
    	 String sstart=request.getParameter("st") ;
    	 System.out.println(sstart);
    	 String send=request.getParameter("ed") ;
    	 System.out.println(send);
    	 Date start=null;
    	 Date end=null;
    	 SimpleDateFormat sef=new SimpleDateFormat("yyyy-MM-dd");
    	 try {
    		 start=sef.parse(sstart);
    		 end=sef.parse(send);
    		 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 
    	 
    	 System.out.println(start);
    	 System.out.println(end);
    	 int product_nb=Integer.parseInt(request.getParameter("pd_no")) ;
    	 String buyer=request.getParameter("buyer");
		 
		
		 Payment p=new Payment(imp_uid,pay_method,date,start,end,paid_amount,product_nb,buyer,pd_name);
		 int result=new PaymentService().insertPayment(p);
		 if(result<=0) {
			 System.out.println("멈춰!");
		 }
		
		 
		 response.setContentType("application/json;charset=utf-8");
		 new Gson().toJson(p,response.getWriter());
		
		 
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
