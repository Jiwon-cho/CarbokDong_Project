package com.camp.model.dao;

import java.sql.*;
import java.util.Vector;

import com.camp.model.vo.Camp;

public class CampDao {
	String id = "map";
	String pass = "map";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection con; // DB�� �����Ҽ��ֵ��� ����(java.sql ����Ʈ�ؾ���)
	PreparedStatement pstmt; // DB���� ���� ��������ִ� ��ü
	ResultSet rs; // DB�� ���̺��� ����� ���Ϲ޾� �ڹٿ� �������ִ� ��ü
	
	public void getCon() {
	
		try {
			// 1. �ش� �����ͺ��̽� ����Ѵٰ� ����(����Ŭ�� Ŭ���� ���)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. �ش� �����ͺ��̽��� ����
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
				// 1. Connection ����
				getCon();
				// ���� �غ�
				String sql = "SELECT * FROM CAMP";
				// ���� ����
				pstmt = con.prepareStatement(sql);
				// ������ ������ ����� ����
				rs = pstmt.executeQuery();
				// �ݺ����� ����ؼ� rs�� ����� �����͸� �����ؾ���
				while(rs.next()) {
				// �� ����� �����͸�ŭ�� �ݺ��ؼ� ������ �����ڴٴ� ��
					Camp camp = new Camp(); // �÷����� ������ �����͸� ���� ���� Ŭ���� ��ü�� ����
					camp.setName(rs.getString(1));
					camp.setLatitude(rs.getDouble(2));
					camp.setLongitude(rs.getDouble(3));
					camp.setPrice(rs.getInt(4));
					camp.setRating(rs.getInt(5));
					System.out.println(camp.getName());
					//��Ű¡�� CampŬ������ ���Ϳ� ����
					v.add(camp);

				}
				//�ڿ��ݳ�
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
