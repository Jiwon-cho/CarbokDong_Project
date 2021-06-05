package com.payment.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.List;

import com.payment.model.dao.PaymentDao;
import com.payment.model.vo.Payment;

public class PaymentService {
	private static PaymentDao dao = PaymentDao.getInstance();
	
	public int insertPayment(Payment p) {
		Connection conn=getConnection();
		int result=dao.insertPayment(conn,p);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int rentalVeri(String pm_no) {
		Connection conn=getConnection();
		int result=dao.rentalVeri(conn,pm_no);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	
}
