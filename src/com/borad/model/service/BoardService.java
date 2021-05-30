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
import com.borad.model.vo.Files;



public class BoardService {

	
private BoardDao dao=new BoardDao();
	
	public int WriteBorad(Board b) {
		
		Connection conn=getConnection();
		int result=dao.WriteBoard(conn,b);
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
	public Board selectNoPage(int No,boolean readFlag) {
		Connection conn=getConnection();
		Board b=dao.selectNoPage(conn,No);
		if(b!=null&&!readFlag) {
			int result=dao.updateReadCount(conn,No);
			if(result>0) { 
			commit(conn);
			b.setViewCount(b.getViewCount()+1);
			}else rollback(conn);
		}
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
	public int updateBoard(String title,String content,int No) {
		Connection conn=getConnection();
		int result=dao.updateBoard(conn,title,content,No);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int deleteBoard(int No) {
		Connection conn=getConnection();
		int result=dao.deleteBoard(conn,No);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertFile(Files f) {
		Connection conn=getConnection();
		int result=dao.insertFile(conn,f);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}