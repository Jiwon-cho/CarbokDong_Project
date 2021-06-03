package com.member.model.vo;

import java.util.Date;

public class QnA {
	private int no;
	private String title;
	private String content;
	private Date date;
	private String userId;
	private String result;
	private String nickName;
	
	public QnA() {
		// TODO Auto-generated constructor stub
	}

	public QnA(int no, String title, String content, Date date, String userId, String result, String nickName) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.date = date;
		this.userId = userId;
		this.result = result;
		this.nickName = nickName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	
}
