package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Member;

public class MemberService {
	private MemberDao dao=new MemberDao();
	
	public Member login(String userId, String password) {
		Connection conn=getConnection();
		Member m=dao.login(conn,userId,password);
		close(conn);
		return m;
	}
}
