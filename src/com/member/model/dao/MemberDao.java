package com.member.model.dao;

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

import com.borad.model.vo.Board;
import com.borad.model.vo.Files;
import com.member.model.vo.CarBoard;
import com.member.model.vo.Member;

public class MemberDao {
	private Properties prop=new Properties();
	
	public MemberDao() {
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member login(Connection conn, String userId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectLoginMember"));
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("member_Id"));
				m.setUserName(rs.getString("member_nm"));
				m.setEmail(rs.getString("email"));
				m.setAddress(rs.getString("address"));
				m.setNikname(rs.getString("nickname"));
				m.setGender(rs.getString("gender"));
				m.setMemberType(rs.getInt("member_Type"));
				m.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getNikname());
			pstmt.setString(6, m.getGender());
			pstmt.setInt(7, m.getMemberType());
			pstmt.setString(8, m.getPassword());
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Member selectMemberId(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberId"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("member_Id"));
				m.setUserName(rs.getString("member_nm"));
				m.setEmail(rs.getString("email"));
				m.setAddress(rs.getString("address"));
				m.setNikname(rs.getString("nickname"));
				m.setGender(rs.getString("gender"));
				m.setMemberType(rs.getInt("member_Type"));
				m.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public Member selectMemberNickName(Connection conn, String nickName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberNickName"));
			pstmt.setString(1, nickName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setUserId(rs.getString("member_Id"));
				m.setUserName(rs.getString("member_nm"));
				m.setEmail(rs.getString("email"));
				m.setAddress(rs.getString("address"));
				m.setNikname(rs.getString("nickname"));
				m.setGender(rs.getString("gender"));
				m.setMemberType(rs.getInt("member_Type"));
				m.setPassword(rs.getString("password"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public List<CarBoard> selectCarBoardList(Connection conn,int cPage, int numPerpage,String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CarBoard> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCarBoardList"));
			pstmt.setString(1, userId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CarBoard c=new CarBoard();
				c.setCarName(rs.getString("CAR_MODEL"));
				c.setCarPicName(rs.getString("CAR_PIC_NM"));
				c.setCarPsb(rs.getInt("CAR_PSB_"));
				c.setCarTotal(rs.getInt("CAR_TOTAL"));
				c.setIsdel(rs.getString("ISDEL"));
				c.setPrice(rs.getInt("CART_PRICE"));
				c.setCarIdx(rs.getInt("CART_IDX"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectCarBoardCount(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectCarBoardCount"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int shoppingBagDelet(Connection conn, String IDX) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("shoppingBagDelet"));
			pstmt.setString(1, IDX);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Board> selectMyBoardList(Connection conn,int cPage,int numPerpage, String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMyBoardList"));
			pstmt.setString(1, userId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setBoardNb(rs.getInt("board_nb"));
				b.setBoardTitle(rs.getString("board_title"));
				b.setBoradDate(rs.getDate("board_date"));
				b.setBoardContents(rs.getString("board_contents"));
				b.setViewCount(rs.getInt("board_viewcount"));
				b.setMemberId(rs.getString("member_id"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectMyNoticeCount(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMyNoticeCount"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int updateMember(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getAddress());
			pstmt.setString(3, m.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePassword(Connection conn,String userId, String pw) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePassword"));
			pstmt.setString(1, pw);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteMember"));
			pstmt.setString(1, userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
