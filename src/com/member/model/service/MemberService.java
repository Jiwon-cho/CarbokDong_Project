package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.member.model.dao.MemberDao;
import com.member.model.vo.CarBoard;
import com.member.model.vo.Member;

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
	
	public int selectCarBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectCarBoardCount(conn);
		close(conn);
		return result;
	}
	
	public int shoppingBagDelet(String IDX) {
		Connection conn=getConnection();
		int result=dao.shoppingBagDelet(conn,IDX);
		close(conn);
		return result;
	}
	
}