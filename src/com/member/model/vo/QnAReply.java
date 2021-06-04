package com.member.model.vo;

import java.util.Date;

public class QnAReply {
	private int qnAReplyNo;
	private String qnAReplyContent;
	private Date qnAReplyDate;
	private int qnANb;
	
	public QnAReply() {
		// TODO Auto-generated constructor stub
	}

	public QnAReply(int qnAReplyNo, String qnAReplyContent, Date qnAReplyDate, int qnANb) {
		super();
		this.qnAReplyNo = qnAReplyNo;
		this.qnAReplyContent = qnAReplyContent;
		this.qnAReplyDate = qnAReplyDate;
		this.qnANb = qnANb;
	}

	public int getQnAReplyNo() {
		return qnAReplyNo;
	}

	public void setQnAReplyNo(int qnAReplyNo) {
		this.qnAReplyNo = qnAReplyNo;
	}

	public String getQnAReplyContent() {
		return qnAReplyContent;
	}

	public void setQnAReplyContent(String qnAReplyContent) {
		this.qnAReplyContent = qnAReplyContent;
	}

	public Date getQnAReplyDate() {
		return qnAReplyDate;
	}

	public void setQnAReplyDate(Date qnAReplyDate) {
		this.qnAReplyDate = qnAReplyDate;
	}

	public int getQnANb() {
		return qnANb;
	}

	public void setQnANb(int qnANb) {
		this.qnANb = qnANb;
	}
	
	
}
