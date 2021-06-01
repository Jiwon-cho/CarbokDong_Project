package com.borad.model.vo;

import java.util.Date;

public class Board {
	
	private int boardNb;
	private String boardTitle;
	private Date boradDate;
	private String boardContents;
	private int viewCount;
	private String memberId;
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}


	public Board(int boardNb, String boardTitle, Date boradDate, String boardContents, int viewCount, String memberId) {
		super();
		this.boardNb = boardNb;
		this.boardTitle = boardTitle;
		this.boradDate = boradDate;
		this.boardContents = boardContents;
		this.viewCount = viewCount;
		this.memberId = memberId;
	}


	public int getBoardNb() {
		return boardNb;
	}


	public void setBoardNb(int boardNb) {
		this.boardNb = boardNb;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public Date getBoradDate() {
		return boradDate;
	}


	public void setBoradDate(Date boradDate) {
		this.boradDate = boradDate;
	}


	public String getBoardContents() {
		return boardContents;
	}


	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Board [boardNb=" + boardNb + ", boardTitle=" + boardTitle + ", boradDate=" + boradDate
				+ ", boardContents=" + boardContents + ", viewCount=" + viewCount + ", memberId=" + memberId + "]";
	}
	
	
}
