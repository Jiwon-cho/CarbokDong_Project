package com.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userName;
	private String email;
	private String address;
	private String nikname;
	private String gender;
	private int memberType;
	private String password;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String userName, String email, String address, String nikname, String gender,
			int memberType, String password) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.nikname = nikname;
		this.gender = gender;
		this.memberType = memberType;
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNikname() {
		return nikname;
	}

	public void setNikname(String nikname) {
		this.nikname = nikname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getMemberType() {
		return memberType;
	}

	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	
}
