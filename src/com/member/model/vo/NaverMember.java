package com.member.model.vo;

public class NaverMember {
	private String email;
	private String nickname;
	
	public NaverMember() {
		// TODO Auto-generated constructor stub
	}

	public NaverMember(String email, String nickname) {
		super();
		this.email = email;
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "NaverMember [email=" + email + ", nickname=" + nickname + "]";
	}

	
	
	
}
