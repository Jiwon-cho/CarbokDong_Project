package com.borad.model.vo;

import java.util.Date;

public class Reply {

	private int replyNo;
	private String replyContent;
	private Date replyDate;
	private int boardNb;
	private int replyLevel;
	private int replyRef;
	private String replyWriter;
	
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}


	public Reply(int replyNo, String replyContent, Date replyDate, int boardNb, int replyLevel, int replyRef,
			String replyWriter) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.boardNb = boardNb;
		this.replyLevel = replyLevel;
		this.replyRef = replyRef;
		this.replyWriter = replyWriter;
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	public Date getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}


	public int getBoardNb() {
		return boardNb;
	}


	public void setBoardNb(int boardNb) {
		this.boardNb = boardNb;
	}


	public int getReplyLevel() {
		return replyLevel;
	}


	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}


	public int getReplyRef() {
		return replyRef;
	}


	public void setReplyRef(int replyRef) {
		this.replyRef = replyRef;
	}


	public String getReplyWriter() {
		return replyWriter;
	}


	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}


	

	
	
}