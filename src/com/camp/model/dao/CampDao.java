package com.camp.model.dao;

import java.sql.*;
import java.util.Vector;

import com.camp.model.vo.Camp;

public class CampDao {
	String id = "map";
	String pass = "map";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection con; // DB에 접근할수있도록 설정(java.sql 임포트해야함)
	PreparedStatement pstmt; // DB에서 쿼리 실행시켜주는 객체
	ResultSet rs; // DB의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	public void getCon() {
	
		try {
			// 1. 해당 데이터베이스 사용한다고 선언(오라클용 클래스 등록)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 해당 데이터베이스에 접속
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
				// 1. Connection 연결
				getCon();
				// 쿼리 준비
				String sql = "SELECT * FROM CAMP";
				// 쿼리 실행
				pstmt = con.prepareStatement(sql);
				// 쿼리를 실행한 결과를 리턴
				rs = pstmt.executeQuery();
				// 반복문을 사용해서 rs에 저장된 데이터를 추출해야함
				while(rs.next()) {
				// ㄴ 저장된 데이터만큼만 반복해서 데이터 빼오겠다는 뜻
					Camp camp = new Camp(); // 컬럼으로 나눠진 데이터를 새로 만든 클래스 객체에 저장
					camp.setName(rs.getString(1));
					camp.setLatitude(rs.getDouble(2));
					camp.setLongitude(rs.getDouble(3));
					camp.setPrice(rs.getInt(4));
					camp.setRating(rs.getInt(5));
					System.out.println(camp.getName());
					//패키징된 Camp클래스를 벡터에 저장
					v.add(camp);

				}
				//자원반납
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
