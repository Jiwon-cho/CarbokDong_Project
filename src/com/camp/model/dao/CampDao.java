package com.camp.model.dao;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.borad.model.dao.BoardDao;
import com.camp.model.vo.Camp;
import com.camp.model.vo.CampHotplace;
import com.camp.model.vo.CampReserve;

public class CampDao {
	
	private Properties prop = new Properties();
	
	String id = "CARBOK";
	String pass = "CARBOK";
	String url = "jdbc:oracle:thin:@rclass.iptime.org:1521:xe";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public CampDao() {
		String path=BoardDao.class.getResource("/sql/map_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
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
				pstmt = con.prepareStatement(prop.getProperty("selectAllCamp"));
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
	     		pstmt = con.prepareStatement(prop.getProperty("getOneCamp"));
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
	     		
	     		pstmt = con.prepareStatement(prop.getProperty("getCampPhoto"));
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
	     		pstmt = con.prepareStatement(prop.getProperty("getHotplace"));
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
	    
	    public boolean checkLike(String id, int num) {
	    	boolean result = false;
	    	String user = null;
	    	getCon();
	    	try {
	     		pstmt = con.prepareStatement(prop.getProperty("checkLike"));
	     		pstmt.setInt(1, num);
	     		rs = pstmt.executeQuery();
	     		while(rs.next()) {
	     			user = rs.getString(1);
	     		}
	     		System.out.println("id : "+id);
	     		System.out.println("user : "+user);
	     		// 일치하지않아서 등록 가능하면 true 반환
	     		if(user.equals(id)) {
	     			result=false;
	     		} else if(id.equals("no")){
	     			result=false;
	     		} else if(user.equals(null)){
	     			result=false;
	     		} else if(user.equals("null")){
	     			result=false;
	     		} else {
	     			result=true;
	     		}
	     		System.out.println(result);
	     		con.close();
	     	}catch (Exception e){
	     		result=true;
	     		System.out.println(result);
	     	} finally {
	     		if(result) {
	     			addLike(id, num);
	     		}
	     	}
	    	return result;
	    }
	    
	    public int addLike(String id, int num) {
	    	int result = 0;
	    	getCon();
	    	try {
	     		pstmt = con.prepareStatement(prop.getProperty("addLike"));
	     		pstmt.setString(1, id);
	     		pstmt.setInt(2, num);
	     		rs = pstmt.executeQuery();
	     		result=1;
	     		System.out.println("좋아요 등록완료");
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	}
	    	return result;
	    }
	    
	    public int getLike(int num) {
	    	getCon();
	    	int result=0;
	 		
	     	try {
	     		pstmt = con.prepareStatement(prop.getProperty("getLike"));
	     		pstmt.setInt(1, num);
	     		rs = pstmt.executeQuery();
	     		while(rs.next()) {
	     			result = rs.getInt(1);
	     		}
	     		con.close();
	     	}catch (Exception e){
	     		e.printStackTrace();
	     	}
			System.out.println("좋아요 숫자 : "+result);
	     	return result;
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
