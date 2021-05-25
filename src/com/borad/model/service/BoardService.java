package com.borad.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.borad.model.dao.BoardDao;
import com.borad.model.vo.Board;



public class BoardService {

	
private BoardDao dao=new BoardDao();
	
	public int WriteBorad(String title,String content) {
		
		Connection conn=getConnection();
		int result=dao.WriteBoard(conn,title,content);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<Board> selectBoardList(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Board>list=dao.selectBoardList(conn,cPage,numPerpage);
		close(conn);
		return list;
				
	}
	public int selectNoticeCount() {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	public Board selectNoPage(int No) {
		Connection conn=getConnection();
		Board b=dao.selectNoPage(conn,No);
		close(conn);
		return b;
	}
}
