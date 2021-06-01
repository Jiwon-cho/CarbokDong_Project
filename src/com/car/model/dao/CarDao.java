package com.car.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.car.model.vo.Car;
import com.member.model.dao.MemberDao;

public class CarDao {
	private static CarDao newsDao;
	private Properties prop=new Properties();
	

	private CarDao() {
		String path=MemberDao.class.getResource("/sql/car_sql.properties").getPath();
	
		try {
			prop.load(new FileReader(path));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static CarDao getInstance() {
		try {
			if (newsDao == null) {
				newsDao = new CarDao();
			}
			return newsDao;
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
}
