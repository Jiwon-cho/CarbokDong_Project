package com.camp.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.camp.model.vo.Camp;
import com.camp.model.vo.CampHotplace;
import com.camp.model.vo.CampReserve;

public class CampDao {
	
	String id = "CARBOK";
	String pass = "CARBOK";
	String url = "jdbc:oracle:thin:@rclass.iptime.org:1521:xe";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, pass);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
		public List<Camp> selectAllMember(){
			List<Camp> v = new ArrayList<Camp>();
			
			try {
				getCon();
				String sql = "SELECT * FROM CAMPING";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
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
					
					v.add(camp);

				}
				con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
			}
			return v;
		}
		

	    // 캠핑장 하나의 정보를 리턴
	    public Camp getOneCamp(String name){
	    	Camp camp = new Camp();
	    	getCon();
	 		
	     	try {
	     		String sql = "SELECT * FROM CAMPING WHERE CAMPING_NM = ?";
	     		pstmt = con.prepareStatement(sql);
	     		pstmt.setString(1, name);
	     		rs = pstmt.executeQuery();
	     		
	     		while(rs.next()){
	     			camp = new Camp();
	     			camp.setNum(rs.getInt(1));
					camp.setName(rs.getString(2));
					camp.setLocation(rs.getString(3));
					camp.setInfo(rs.getString(4));
					camp.setLatitude(rs.getDouble(5));
					camp.setLongitude(rs.getDouble(6));
					camp.setPrice(rs.getInt(7));
					camp.setFacility(rs.getString(8));
	     		}
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	}
			System.out.println(camp.getName());
	     	return camp;
	    }
	    
	    // 사진 캠핑장 사진 파일명 리턴
	    public List<String> getCampPhoto(int num) {
	    	List<String> photos = new ArrayList<String>();
	    	
	     	try {
	     		getCon();
	     		
	     		String sql = "SELECT CAMPING_PIC_NM FROM CAMPING_PIC WHERE CAMPING_NB = ?";
	     		pstmt = con.prepareStatement(sql);
	     		pstmt.setInt(1, num);
	     		rs = pstmt.executeQuery();
	     		while(rs.next()){
	     			photos.add(rs.getString(1));
	     		}
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	}
			System.out.println(photos);
	     	return photos;
	    }
	    
	    // 핫플레이스 배열 리턴
	    public List<CampHotplace> getHotplace(int num){
	    	List<CampHotplace> hot = new ArrayList<CampHotplace>();
	    	getCon();
	 		
	     	try {
	     		String sql = "SELECT * FROM CAMPING_HOTPLACE WHERE CAMPING_NB = ?";
	     		pstmt = con.prepareStatement(sql);
	     		pstmt.setInt(1, num);
	     		rs = pstmt.executeQuery();
	     		
	     		while(rs.next()){
	     			CampHotplace campHot = new CampHotplace();
	     			campHot.setNum(rs.getInt(1));
	     			campHot.setFile(rs.getString(2));
	     			campHot.setName(rs.getString(3));
	     			campHot.setType(rs.getString(4));
	     			
	     			
	     			hot.add(campHot);
	     			System.out.println(campHot.getName());
	     		}
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	}
			
	     	return hot;
	    }
	    
//	    public List<CampReserve> campReserveInfo(){
//			List<CampReserve> v = new ArrayList();
//			
//			try {
//				getCon();
//				String sql = "SELECT * FROM CAMPRESERVE";
//				pstmt = con.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				while(rs.next()) {
//					CampReserve campReserve = new CampReserve();
//					campReserve.setReserveNo(rs.getInt(1));
//					campReserve.setCampNo(rs.getInt(2));
//					campReserve.setUserId(rs.getString(3));
//					campReserve.setCampName(rs.getString(4));
//					campReserve.setPeriod(rs.getInt(5));
//					campReserve.setDate(rs.getString(6));
//					System.out.println(campReserve.getCampName());
//					
//					v.add(campReserve);
//
//				}
//				con.close();
//				
//			}catch(Exception e) {
//				e.printStackTrace();
//			} finally {
//			}
//			return v;
//		}
//		
//		public void setReserve (CampReserve camp) {
//			getCon();
//			
//			try {
//				String sql = "INSERT INTO CAMPRESERVE VALUES(RESERVENO.NEXTVAL,?,?,?,? )";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, camp.getUserId());
//				pstmt.setString(2, camp.getCampName());
//				pstmt.setInt(3, camp.getPeriod());
//				pstmt.setString(4, camp.getDate());
//				
//				pstmt.executeUpdate();
//				
//				con.close();
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
	
	
}
