package com.member.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
				m.setUserName(rs.getString("userName"));
				m.setUserId(rs.getString("userId"));
				m.setPassword(rs.getString("password"));
				m.setEmail(rs.getString("email"));
				m.setAddress(rs.getString("address"));
				m.setNikname(rs.getString("nikname"));
				m.setPhone(rs.getString("phone"));
				m.setUserNo(rs.getString("userNo"));
				m.setMemberType(rs.getInt("memberType"));
				m.setCpNb(rs.getInt("cpNb"));
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
			if(m.getMemberType()==2) {
				pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
				pstmt.setInt(10, m.getCpNb());
			}else if(m.getMemberType()==3){
				pstmt=conn.prepareStatement(prop.getProperty("insertMember2"));
			}
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserId());
			pstmt.setString(3, m.getPassword());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getNikname());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getUserNo());
			pstmt.setInt(9, m.getMemberType());
			
			
			
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
