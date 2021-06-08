package com.borad.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.borad.model.vo.Reply;
import com.camp.model.vo.Camp;
import com.car.model.vo.Car;
import com.mbti.model.vo.Mbti;
import com.member.model.vo.Member;
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
	public int insertFile(Files f,int num) {
		Connection conn=getConnection();
		int result=dao.insertFile(conn,f,num);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int FileNoSelect(Board b) {
		Connection conn=getConnection();
		int num=dao.FileNoSelect(conn,b);
		close(conn);
		return num;
	}
	public List<Files> selectImgName(int No) {
		Connection conn=getConnection();
		List<Files> flist=dao.selectImgName(conn,No);
		close(conn);
		return flist;
	}
	public List<Board>selectSearchMember(String type,String keyword,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Board>list=dao.selectSearchMember(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int selectSearchMemberCount(String type,String keyword) {
		Connection conn=getConnection();
		int result=dao.selectSearchMemberCount(conn,type,keyword);
		close(conn);
		return result;
	}
	public int recUpdate(int no,String id) {
		Connection conn=getConnection();
		int result=dao.recUpdate(conn,no,id);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public void recDelete(int no,String id) {
		Connection conn=getConnection();
		dao.recDelete(conn,no,id);
		close(conn);
	}
	public int recCount(int no) {
		Connection conn=getConnection();
		int count=dao.recCount(conn,no);
		close(conn);
		return count;
	}
//	public String selectImages(int boardNo) {
//		Connection conn=getConnection();
//		String img=dao.selectImages(conn,boardNo);
//		close(conn);
//		return img;
//	}
	public List<Files> selectFileList(){
		Connection conn=getConnection();
		List<Files>flist=dao.selectFileList(conn);
		close(conn);
		return flist;
	}
	public int DeleteReply(int reNo) {
		Connection conn=getConnection();
		int result=dao.DeleteReply(conn,reNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Mbti>selectMbtiList(String type){
		Connection conn=getConnection();
		List<Mbti>list=dao.selectMbtiList(conn,type);
		close(conn);
		return list;
	}
}