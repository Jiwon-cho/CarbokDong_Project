package com.car.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.car.model.vo.Car;
import com.car.model.vo.Reviews;


public class CarDao {
	private static CarDao carDao;
	private Properties prop=new Properties();
	

	private CarDao() {
		String path=CarDao.class.getResource("/sql/car_sql.properties").getPath();
	
		try {
			prop.load(new FileReader(path));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static CarDao getInstance() {
		try {
			if (carDao == null) {
				carDao = new CarDao();
			}
			return carDao;
		} catch (Exception e) {
			throw new RuntimeException("[Error: Creating instance fail : " + e.getMessage() + "]");
		}
	}
	
	
	
	public List<Car> selectCarList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Car> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectcarList"));
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
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
		
		
	}
	
	public List<Car> searchCar(Connection conn, String carType){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Car> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("searchCar"));
			pstmt.setString(1, carType);
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
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
		
		
	}
	
	public Car selectCar(Connection conn, int carNB){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Car c=new Car();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCar"));
			pstmt.setInt(1, carNB);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				c.setCarNB(rs.getInt("car_nb"));
				c.setCarType(rs.getString("car_type"));
				c.setCarModel(rs.getString("car_model"));
				c.setCarPpl(rs.getInt("car_ppl"));
				c.setCarTotal(rs.getInt("car_total"));
				c.setCarPsb(rs.getInt("car_psb_"));
				c.setCarInfo(rs.getString("car_info"));
				c.setPrice(rs.getInt("price"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return c;
		
		
	}
	public int insertReviews(Connection conn,Reviews r) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertReviews"));
			pstmt.setString(1, r.getReviewContents());
			pstmt.setInt(2, r.getRating());
			pstmt.setString(3, r.getMemberId());
			pstmt.setInt(4, r.getCarNb());
			pstmt.setString(5, r.getFileName());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<Reviews>selectReviewList(Connection conn,int carNB){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Reviews>rlist=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReviewList"));
			pstmt.setInt(1, carNB);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reviews r=new Reviews();
				r.setReviewNb(rs.getInt("review_nb"));
				r.setReviewContents(rs.getString("review_contents"));
				r.setRating(rs.getInt("rating"));
				r.setMemberId(rs.getString("member_id"));
				r.setCarNb(rs.getInt("car_nb"));
				r.setFileName(rs.getString("file_name"));
				rlist.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return rlist;
	}
}
