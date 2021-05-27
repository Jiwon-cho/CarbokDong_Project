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

import com.borad.model.vo.BoardComment;
import com.borad.model.vo.Board;

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
	
	public int WriteBoard(Connection conn,String title,String content) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertboard"));
			pstmt.setString(1, title);
			pstmt.setString(2, content);
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
				b.setBoardContents(rs.getString("board_contents"));
				b.setMemberId(rs.getString("member_id"));
				b.setBoradDate(rs.getDate("board_date"));
				b.setFilepath(rs.getString("filepath"));
				b.setLikeCount(rs.getInt("likecount"));
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
				b.setBoardContents(rs.getString("board_contents"));
				b.setMemberId(rs.getString("member_id"));
				b.setBoradDate(rs.getDate("board_date"));
				b.setFilepath(rs.getString("filepath"));
				b.setLikeCount(rs.getInt("likecount"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return b;
	}
	public int insertBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertBoardComment"));
			pstmt.setInt(1,bc.getBoardCommentLevel());
			pstmt.setString(2,bc.getBoardCommentWriter());
			pstmt.setString(3,bc.getBoardCommentContent());
			pstmt.setInt(4,bc.getBoardRef());
			//pstmt.setInt(5,bc.getBoardCommentRef()); 
			pstmt.setString(5, bc.getBoardCommentRef()==0?null:String.valueOf(bc.getBoardCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<BoardComment>selectBoardComment(Connection conn, int No){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardComment>list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBoardComment"));
			pstmt.setInt(1, No);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardComment bc=new BoardComment();
				bc.setBoardCommentNo(rs.getInt("board_comment_no"));
				bc.setBoardCommentLevel(rs.getInt("board_comment_level"));
				bc.setBoardCommentWriter(rs.getString("board_comment_writer"));
				bc.setBoardCommentContent(rs.getString("board_comment_content"));
				bc.setBoardRef(rs.getInt("board_ref"));
				bc.setBoardCommentRef(rs.getInt("board_comment_ref"));
				bc.setBoardCommentDate(rs.getDate("board_comment_date"));
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
				b.setBoardContents(rs.getString("board_contents"));
				b.setMemberId(rs.getString("member_id"));
				b.setBoradDate(rs.getDate("board_date"));
				b.setFilepath(rs.getString("filepath"));
				b.setLikeCount(rs.getInt("likecount"));
				pplist.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return pplist;
	}
}