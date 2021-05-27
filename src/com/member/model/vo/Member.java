package com.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String password;
	private String userName;
	private String nikname;
	private String email;
	private String phone;
	private String address;
	private int memberType;
	private int cpNb;
	private String userNo;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String password, String userName, String nikname, String email, String phone,
			String address, int memberType, int cpNb, String userNo) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.nikname = nikname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.memberType = memberType;
		this.cpNb = cpNb;
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNikname() {
		return nikname;
	}

	public void setNikname(String nikname) {
		this.nikname = nikname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getMemberType() {
		return memberType;
	}

	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}

	public int getCpNb() {
		return cpNb;
	}

	public void setCpNb(int cpNb) {
		this.cpNb = cpNb;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	
}
