package com.borad.model.dao;

import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.borad.model.vo.Reply;
import com.borad.model.vo.Board;
import com.borad.model.vo.Files;

import static com.common.JDBCTemplate.close;



public class BoardDao {

	
private Properties prop=new Properties();
	
	public BoardDao() {
		String path=BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int WriteBoard(Connection conn,Board b) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertboard"));
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContents());
			pstmt.setString(3, b.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public List<Board> selectBoardList(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectboardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
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
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectboardCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	public Board selectNoPage(Connection conn,int No) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Board b=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectNoPage"));
			pstmt.setInt(1, No);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b=new Board();
				b.setBoardNb(rs.getInt("board_nb"));
				b.setBoardTitle(rs.getString("board_title"));
				b.setBoradDate(rs.getDate("board_date"));
				b.setBoardContents(rs.getString("board_contents"));
				b.setViewCount(rs.getInt("board_viewcount"));
				b.setMemberId(rs.getString("member_id"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return b;
	}
	public int insertBoardComment(Connection conn,Reply bc) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertBoardComment"));
			pstmt.setString(1,bc.getReplyContent());
			pstmt.setInt(2, bc.getBoardNb());
			pstmt.setInt(3,bc.getReplyLevel());
			pstmt.setString(4, bc.getReplyRef()==0?null:String.valueOf(bc.getReplyRef()));
			pstmt.setString(5, bc.getReplyWriter());
			//pstmt.setInt(5,bc.getBoardCommentRef()); 
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<Reply>selectBoardComment(Connection conn, int No){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Reply>list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBoardComment"));
			pstmt.setInt(1, No);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply bc=new Reply();
				bc.setReplyNo(rs.getInt("reply_no"));
				bc.setReplyContent(rs.getString("reply_contents"));
				bc.setReplyDate(rs.getDate("reply_date"));
				bc.setBoardNb(rs.getInt("board_nb"));
				bc.setReplyLevel(rs.getInt("reply_level"));
				bc.setReplyRef(rs.getInt("reply_ref"));
				list.add(bc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectReplyCount(Connection conn,int No) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReplyCount"));
			pstmt.setInt(1, No);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public List<Board>selectppBoard(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board>pplist=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectppBoard"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setBoardNb(rs.getInt("board_nb"));
				b.setBoardTitle(rs.getString("board_title"));
				b.setBoradDate(rs.getDate("board_date"));
				b.setBoardContents(rs.getString("board_contents"));
				b.setViewCount(rs.getInt("board_viewcount"));
				b.setMemberId(rs.getString("member_id"));
				pplist.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return pplist;
	}
	public int updateBoard(Connection conn,String title,String content,int No) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateBoard"));
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, No);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}return result;
	}
	
	public int deleteBoard(Connection conn,int No) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteBoard"));
			pstmt.setInt(1, No);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int updateReadCount(Connection conn,int No) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateReadCount"));
			pstmt.setInt(1, No);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertFile(Connection conn,Files f) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertFile"));
			pstmt.setString(1, f.getFileNm());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}