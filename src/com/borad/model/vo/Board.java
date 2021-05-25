package com.borad.model.vo;

import java.util.Date;

public class Board {
	
	private int boardNb;
	private String boardTitle;
	private String boardContents;
	private String memberId;
	private Date boradDate;
	private String filepath;
	private int likeCount;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNb, String boardTitle, String boardContents, String memberId, Date boradDate, String filepath,
			int likeCount) {
		super();
		this.boardNb = boardNb;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.memberId = memberId;
		this.boradDate = boradDate;
		this.filepath = filepath;
		this.likeCount = likeCount;
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

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Date getBoradDate() {
		return boradDate;
	}

	public void setBoradDate(Date boradDate) {
		this.boradDate = boradDate;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	

	

}
