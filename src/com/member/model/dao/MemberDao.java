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
import com.member.model.vo.CarBoard;
import com.member.model.vo.Member;
import com.member.model.vo.QnA;
import com.member.model.vo.QnAReply;
import com.payment.model.vo.Payment;

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
				m.setMemberType(rs.getInt("MEMBER_TYPE"));
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
	
	public List<QnA> selectQnAList(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QnA> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnAList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnA q=new QnA();
				q.setNo(rs.getInt("QA_NB"));
				q.setTitle(rs.getString("QA_TITLE"));
				q.setContent(rs.getString("QA_CONTENT"));
				q.setDate(rs.getDate("QA_DATE"));
				q.setUserId(rs.getString("QA_MEMBER_ID"));
				q.setResult(rs.getString("QA_RESULT"));
				q.setFileOriginalName(rs.getString("QA_ORIGINAL_FILENAME"));
				q.setFileReName(rs.getString("QA_RENAME_FILENAME"));
				q.setQapublic(rs.getString("QA_PUBLIC"));
				q.setNickName(rs.getString("NICKNAME"));
				list.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectQnACount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnACount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public List<QnA> selectSearchQnA(Connection conn,int cPage,int numPerpage,String type,String keyword){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QnA> list=new ArrayList();
		String sql=prop.getProperty("selectSearchQnA");
		try {
			pstmt=conn.prepareStatement(sql.replace("#", type));
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnA q=new QnA();
				q.setNo(rs.getInt("QA_NB"));
				q.setTitle(rs.getString("QA_TITLE"));
				q.setContent(rs.getString("QA_CONTENT"));
				q.setDate(rs.getDate("QA_DATE"));
				q.setUserId(rs.getString("QA_MEMBER_ID"));
				q.setResult(rs.getString("QA_RESULT"));
				q.setFileOriginalName(rs.getString("QA_ORIGINAL_FILENAME"));
				q.setFileReName(rs.getString("QA_RENAME_FILENAME"));
				q.setQapublic(rs.getString("QA_PUBLIC"));
				q.setNickName(rs.getString("NICKNAME"));
				list.add(q);		
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectSearchQnACount(Connection conn,String type,String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectSearchQnACount");
		try {
			pstmt=conn.prepareStatement(sql.replace("#", type));
			pstmt.setString(1, "%"+keyword+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public List<Payment> selectPayment(Connection conn,int cPage, int numPerpage,String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Payment> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectPayment"));
			pstmt.setString(1, userId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Payment p=new Payment();
				p.setPaymentsNo(rs.getString("PAYMENTS_NO"));

				p.setPaymetType(rs.getString("PAYMENT_TYPE"));

				p.setPaymentDate(rs.getDate("PAYMENT_DATE"));
				p.setStartDate(rs.getDate("START_DATE"));
				p.setEndDate(rs.getDate("END_DATE"));
				p.setPrice(rs.getInt("PRICE"));
				p.setProductNb(rs.getInt("PRODUCT_NB"));
				p.setProductNm(rs.getString("PRODUCT_NM"));
				p.setMemberId(rs.getString("MEMBER_ID"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectPaymentCount(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectPaymentCount"));
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
	
	public QnA selectQnA(Connection conn,int QnANo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		QnA q=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnA"));
			pstmt.setInt(1, QnANo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				q=new QnA();
				q.setContent(rs.getString("QA_CONTENT"));
				q.setDate(rs.getDate("QA_DATE"));
				q.setNickName(rs.getString("NICKNAME"));
				q.setNo(rs.getInt("QA_NB"));
				q.setResult(rs.getString("QA_RESULT"));
				q.setTitle(rs.getString("QA_TITLE"));
				q.setUserId(rs.getString("QA_MEMBER_ID"));
				q.setFileOriginalName(rs.getString("QA_ORIGINAL_FILENAME"));
				q.setFileReName(rs.getString("QA_RENAME_FILENAME"));
				q.setQapublic(rs.getString("QA_PUBLIC"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return q;
	}
	
	public List<QnAReply> selectQnAReply(Connection conn, int boardNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QnAReply> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectQnAReply"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnAReply qr=new QnAReply();
				qr.setQnANb(rs.getInt("QA_REPLY_NB"));
				qr.setQnAReplyContent(rs.getString("QA_REPLY_CONTENTS"));
				qr.setQnAReplyDate(rs.getDate("QA_REPLY_DATE"));
				qr.setQnAReplyNo(rs.getInt("QA_REPLY_NO"));
				list.add(qr);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int insertQnAReply(Connection conn,QnAReply qr) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertQnAReply"));
			pstmt.setString(1, qr.getQnAReplyContent());
			pstmt.setInt(2, qr.getQnANb());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteQnAReply(Connection conn, int QnAReplyNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteQnAReply"));
			pstmt.setInt(1, QnAReplyNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteQnA(Connection conn, int QnANo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteQnA"));
			pstmt.setInt(1, QnANo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteQnAReply2"));
			pstmt.setInt(1, QnANo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int resultQnA(Connection conn, int QnANo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("resultQnA"));
			pstmt.setString(1, "Y");
			pstmt.setInt(2, QnANo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateQnA(Connection conn, QnA q,int QnANo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateQnA"));
			pstmt.setString(1, q.getTitle());
			pstmt.setString(2, q.getContent());
			pstmt.setString(3, q.getFileOriginalName());
			pstmt.setString(4, q.getFileReName());
			pstmt.setString(5, q.getQapublic());
			pstmt.setInt(6, QnANo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertQnA(Connection conn,QnA q) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertQnA"));
			pstmt.setString(1, q.getTitle());
			pstmt.setString(2, q.getContent());
			pstmt.setString(3, q.getUserId());
			pstmt.setString(4, "N");
			pstmt.setString(5, q.getFileOriginalName());
			pstmt.setString(6, q.getFileReName());
			pstmt.setString(7, q.getQapublic());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
