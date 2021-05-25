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
			con = DriverManager.getConnection(url, id, pass); // java.sql ����Ʈ
			System.out.println("�����");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// ��� ȸ���� ������ return �ϴ� �޼���
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
					//��Ű¡�� CampŬ������ ���Ϳ� ����
					v.add(camp);

				}
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				System.out.println("DB����õ���..");
			}
			// ������ �� ����� ���͸� �ݳ�
			return v;
		}
	
	
}
