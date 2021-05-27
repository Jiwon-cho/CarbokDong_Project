package com.camp.model.dao;

import java.sql.*;
import java.util.Vector;

import com.camp.model.vo.Camp;
import com.camp.model.vo.CampReserve;

public class CampDao {
	
	String id = "map";
	String pass = "map";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, pass);
			System.out.println("연결됨");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
		public Vector<Camp> selectAllMember(){
			Vector<Camp> v = new Vector<>();
			
			try {
				getCon();
				String sql = "SELECT * FROM CAMP";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Camp camp = new Camp();
					camp.setName(rs.getString(1));
					camp.setLatitude(rs.getDouble(2));
					camp.setLongitude(rs.getDouble(3));
					camp.setPrice(rs.getInt(4));
					camp.setRating(rs.getInt(5));
					System.out.println(camp.getName());
					
					v.add(camp);

				}
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("DB연결시도함..");
			}
			return v;
		}
		

	    //하나의 캠핑장 정보를 리턴하는 매소드
	    public Camp getOneCamp(String name){
	    	Camp camp = new Camp();
	    	getCon();
	 		
	     	try {
	     		String sql = "SELECT * FROM CAMP WHERE NAME = ?";
	     		pstmt = con.prepareStatement(sql);
	     		pstmt.setString(1, name);
	     		System.out.println("받아온 이름 : "+name);
	     		rs = pstmt.executeQuery();
	     		
	     		//반복문을 돌면서 데이터를 저장
	     		while(rs.next()){
	     			camp = new Camp();
					camp.setName(rs.getString(1));
					camp.setLatitude(rs.getDouble(2));
					camp.setLongitude(rs.getDouble(3));
					camp.setPrice(rs.getInt(4));
					camp.setRating(rs.getInt(5));
	     		}
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	}
			System.out.println(camp.getName());
	     	return camp;
	    }
	    
	    public Vector<CampReserve> campReserveInfo(){
			Vector<CampReserve> v = new Vector<>();
			
			try {
				getCon();
				String sql = "SELECT * FROM CAMPRESERVE";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					CampReserve campReserve = new CampReserve();
					campReserve.setReserveNo(rs.getInt(1));
					campReserve.setCampNo(rs.getInt(2));
					campReserve.setUserId(rs.getString(3));
					campReserve.setCampName(rs.getString(4));
					campReserve.setPeriod(rs.getInt(5));
					campReserve.setDate(rs.getString(6));
					System.out.println(campReserve.getCampName());
					
					v.add(campReserve);

				}
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("DB연결시도함..");
			}
			return v;
		}
		
		public void setReserve (CampReserve camp) {
			getCon();
			
			try {
				String sql = "INSERT INTO CAMPRESERVE VALUES(RESERVENO.NEXTVAL,?,?,?,? )";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, camp.getUserId());
				pstmt.setString(2, camp.getCampName());
				pstmt.setInt(3, camp.getPeriod());
				pstmt.setString(4, camp.getDate());
				
				pstmt.executeUpdate();
				
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	
}
