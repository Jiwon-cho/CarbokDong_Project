package com.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.common.JDBCTemplate.close;
import com.payment.model.vo.Payment;



public class AdminDao {
	private static AdminDao adminDao;
	private Properties prop=new Properties();
	

	private AdminDao() {
		String path=AdminDao.class.getResource("/sql/admin_sql.properties").getPath();
	
		try {
			prop.load(new FileReader(path));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static AdminDao getInstance() {
		try {
			if (adminDao == null) {
				adminDao = new AdminDao();
			}
			return adminDao;
		} catch (Exception e) {
			throw new RuntimeException("[Error: Creating instance fail : " + e.getMessage() + "]");
		}
	}
	
	
	public List<Payment> selectPayments(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Payment> list=new ArrayList<Payment>();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectPayments"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Payment p=new Payment();
				p.setPaymentsNo(rs.getString("payments_no"));
				p.setPaymetType(rs.getString("payment_type"));
				p.setPaymentDate(rs.getDate("payment_date"));
				p.setStartDate(rs.getDate("start_date"));
				p.setEndDate(rs.getDate("end_date"));
				p.setPrice(rs.getInt("price"));
				p.setProductNb(rs.getInt("product_nb"));
				p.setMemberId(rs.getString("member_id"));
				p.setProductNm(rs.getString("product_nm"));
				list.add(p);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
			
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
