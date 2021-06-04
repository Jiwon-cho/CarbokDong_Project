package com.payment.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.payment.model.vo.Payment;


public class PaymentDao {
	private static PaymentDao paymentDao;
	private Properties prop=new Properties();
	

	private PaymentDao() {
		String path=PaymentDao.class.getResource("/sql/payment_sql.properties").getPath();
	
		try {
			prop.load(new FileReader(path));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public static PaymentDao getInstance() {
		try {
			if (paymentDao == null) {
				paymentDao = new PaymentDao();
			}
			return paymentDao;
		} catch (Exception e) {
			throw new RuntimeException("[Error: Creating instance fail : " + e.getMessage() + "]");
		}
	}
	
	
	
	public int insertPayment(Connection conn, Payment p) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertPayment"));
			pstmt.setString(1, p.getPaymentsNo());
			pstmt.setString(2, p.getPaymetType());
			long pdt=p.getPaymentDate().getTime();
			Date dt=new Date(pdt);
			long sdt=p.getStartDate().getTime();
			Date sd=new Date(sdt);
			long edt=p.getEndDate().getTime();
			Date ed=new Date(edt);
			pstmt.setDate(3,dt);
			pstmt.setDate(4,sd);
			pstmt.setDate(5, ed);
			pstmt.setInt(6, p.getPrice());
			pstmt.setInt(7, p.getProductNb());
			pstmt.setString(8,p.getMemberId());
			pstmt.setString(9,p.getProductNm());
			
			result=pstmt.executeUpdate();
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
