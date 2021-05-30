package com.borad.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.borad.model.vo.Reply;
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
	public int insertBoardComment(Reply bc) {
		Connection conn=getConnection();
		int result=dao.insertBoardComment(conn,bc);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<Reply>selectBoardComment(int No){
		Connection conn=getConnection();
		List<Reply>list=dao.selectBoardComment(conn,No);
		close(conn);
		return list;
	}
	public int selectReplyCount(int No) {
		Connection conn=getConnection();
		int result=dao.selectReplyCount(conn,No);
		close(conn);
		return result;
	}
	public List<Board>selectppBoard(){
		Connection conn=getConnection();
		List<Board>pplist=dao.selectppBoard(conn);
		close(conn);
		return pplist;
	}
}