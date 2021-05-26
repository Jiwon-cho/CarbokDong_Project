package com.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String password;
	private String userName;
	private String gender;
	private String nikname;
	private int age;
	private String email;
	private String phone;
	private String address;
	private int memberType;
	private int cpNb;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String userId, String password, String userName, String gender, String nikname, int age, String email,
			String phone, String address, int memberType, int cpNb) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.gender = gender;
		this.nikname = nikname;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.memberType = memberType;
		this.cpNb = cpNb;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNikname() {
		return nikname;
	}

	public void setNikname(String nikname) {
		this.nikname = nikname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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
	
	
}
