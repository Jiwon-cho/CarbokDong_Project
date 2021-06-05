package com.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.common.JDBCTemplate.close;

import com.camp.model.vo.Camp;
import com.car.model.vo.Car;
import com.member.model.vo.Member;
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
	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	public int selectCarCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCarCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	public int selectCampingCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCampingCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	public List<Member>selectMemberList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member>mlist=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberList"));
			rs=pstmt.executeQuery();
			while(rs.next()){
				Member m=new Member();
				m.setUserId(rs.getString("member_Id"));
				m.setUserName(rs.getString("member_nm"));
				m.setEmail(rs.getString("email"));
				m.setAddress(rs.getString("address"));
				m.setNikname(rs.getString("nickname"));
				m.setGender(rs.getString("gender"));
				m.setMemberType(rs.getInt("member_Type"));
				m.setPassword(rs.getString("password"));
				mlist.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return mlist;
	}
	public List<Car>selectCarList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Car>clist=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCarList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Car c=new Car();
				c.setCarNB(rs.getInt("car_nb"));
				c.setCarType(rs.getString("car_type"));
				c.setCarModel(rs.getString("car_model"));
				c.setCarPpl(rs.getInt("car_ppl"));
				c.setCarTotal(rs.getInt("car_total"));
				c.setCarPsb(rs.getInt("car_psb_"));
				c.setCarInfo(rs.getString("car_info"));
				c.setPrice(rs.getInt("price"));
				clist.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return clist;
	}
	public List<Camp>selectCampList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Camp>camlist=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCampList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Camp camp = new Camp();
				camp.setNum(rs.getInt(1));
				camp.setName(rs.getString(2));
				camp.setLocation(rs.getString(3));
				camp.setInfo(rs.getString(4));
				camp.setLatitude(rs.getDouble(5));
				camp.setLongitude(rs.getDouble(6));
				camp.setPrice(rs.getInt(7));
				camp.setFacility(rs.getString(8));
				camlist.add(camp);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return camlist;
	}
	public int DeleteMembersel(Connection conn,String id) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("DeleteMembersel"));
			pstmt.setString(1, id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertCarsel(Connection conn,Car c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertCarsel"));
			pstmt.setString(1, c.getCarType());
			pstmt.setString(2, c.getCarModel());
			pstmt.setInt(3, c.getCarPpl());
			pstmt.setInt(4, c.getCarTotal());
			pstmt.setInt(5, c.getCarPsb());
			pstmt.setString(6, c.getCarInfo());
			pstmt.setInt(7, c.getPrice());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int DeleteCarsel(Connection conn,int No) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("DeleteCarsel"));
			pstmt.setInt(1, No);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int rentalEnd(Connection conn, String pm_no) {
		PreparedStatement pstmt=null;
		int a=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("rentalEnd"));
			pstmt.setString(1, pm_no);
			a=pstmt.executeUpdate();	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return a;
	}
	

	public int addCar(Connection conn,int pd_nb) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("addCar"));
			pstmt.setInt(1, pd_nb);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public String returnCheck(Connection conn,String pm_no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String a=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("returnCheck"));
			pstmt.setString(1, pm_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				a=rs.getString("rental_end");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return a;
		
	}
	
	
	
	
	
}
