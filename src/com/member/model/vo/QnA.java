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
	private String fileOriginalName;
	private String fileReName;
	private String qapublic;
	
	public QnA() {
		// TODO Auto-generated constructor stub
	}

	public QnA(int no, String title, String content, Date date, String userId, String result, String nickName,
			String fileOriginalName, String fileReName, String qapublic) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.date = date;
		this.userId = userId;
		this.result = result;
		this.nickName = nickName;
		this.fileOriginalName = fileOriginalName;
		this.fileReName = fileReName;
		this.qapublic = qapublic;
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

	public String getFileOriginalName() {
		return fileOriginalName;
	}

	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}

	public String getFileReName() {
		return fileReName;
	}

	public void setFileReName(String fileReName) {
		this.fileReName = fileReName;
	}

	public String getQapublic() {
		return qapublic;
	}

	public void setQapublic(String qapublic) {
		this.qapublic = qapublic;
	}

	

	

	
}
