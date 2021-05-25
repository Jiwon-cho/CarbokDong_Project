package com.camp.model.dao;

import java.sql.*;
import java.util.Vector;

import com.camp.model.vo.Camp;

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
			con = DriverManager.getConnection(url, id, pass); // java.sql 임포트
			System.out.println("연결됨");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 모든 회원의 정보를 return 하는 메서드
		public Vector<Camp> allSelectMember(){
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
					//패키징된 Camp클래스를 벡터에 저장
					v.add(camp);

				}
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("DB연결시도함..");
			}
			// 정보가 다 저장된 벡터를 반납
			return v;
		}
	
	
}
