package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.borad.model.vo.Board;
import com.member.model.dao.MemberDao;
import com.member.model.vo.CarBoard;
import com.member.model.vo.Member;
import com.member.model.vo.Payment;
import com.member.model.vo.QnA;

public class MemberService {
	private MemberDao dao=new MemberDao();
	
	public Member login(String userId, String password) {
		Connection conn=getConnection();
		Member m=dao.login(conn,userId,password);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Member selectMemberId(String userId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberId(conn,userId);
		close(conn);
		return m;
	}
	
	public Member selectMemberNickName(String nickName) {
		Connection conn=getConnection();
		Member m=dao.selectMemberNickName(conn,nickName);
		close(conn);
		return m;
	}
	
	public List<CarBoard> selectCarBoardList(int cPage, int numPerpage,String userId){
		Connection conn=getConnection();
		List<CarBoard> list=dao.selectCarBoardList(conn,cPage,numPerpage,userId);
		close(conn);
		return list;
	}
	
	public int selectCarBoardCount(String userId) {
		Connection conn=getConnection();
		int result=dao.selectCarBoardCount(conn,userId);
		close(conn);
		return result;
	}
	
	public int shoppingBagDelet(String IDX) {
		Connection conn=getConnection();
		int result=dao.shoppingBagDelet(conn,IDX);
		close(conn);
		return result;
	}
	
	public List<Board> selectMyBoardList(int cPage,int numPerpage, String userId){
		Connection conn=getConnection();
		List<Board>list=dao.selectMyBoardList(conn,cPage,numPerpage,userId);
		close(conn);
		return list;
				
	}
	public int selectMyNoticeCount(String userId) {
		Connection conn=getConnection();
		int result=dao.selectMyNoticeCount(conn,userId);
		close(conn);
		return result;
	}
	
	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public int updatePassword(String userId, String pw) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn,userId,pw);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteMember(String userId) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn,userId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Payment> selectPayment(int cPage, int numPerpage,String userId){
		Connection conn=getConnection();
		List<Payment> list=dao.selectPayment(conn,cPage,numPerpage,userId);
		close(conn);
		return list;
	}
	
	public int selectPaymentCount(String userId) {
		Connection conn=getConnection();
		int result=dao.selectPaymentCount(conn,userId);
		close(conn);
		return result;
	}
	
	public List<QnA> selectQnAList(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<QnA> list=dao.selectQnAList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int selectQnACount() {
		Connection conn=getConnection();
		int result=dao.selectQnACount(conn);
		close(conn);
		return result;
	}
	
	public List<QnA> selectSearchQnA(int cPage,int numPerpage,String type,String keyword){
		Connection conn=getConnection();
		List<QnA> list=dao.selectSearchQnA(conn,cPage,numPerpage,type,keyword);
		close(conn);
		return list;
	}
	
	public int selectSearchQnACount(String type,String keyword){
		Connection conn=getConnection();
		int result=dao.selectSearchQnACount(conn,type,keyword);
		close(conn);
		return result;
	}
}