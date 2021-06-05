package com.mbti.model.vo;

public class Mbti {

	private	String mbtiType;
	private	String mbtiInfo;
	private	String mbtiCampName;
	private	String mbtiCampInfo;
	private	String mbtiCampLoc;
	private	String mbtiCampPic;
	
	public Mbti() {
		// TODO Auto-generated constructor stub
	}

	public Mbti(String mbtiType, String mbtiInfo, String mbtiCampName, String mbtiCampInfo, String mbtiCampLoc,
			String mbtiCampPic) {
		super();
		this.mbtiType = mbtiType;
		this.mbtiInfo = mbtiInfo;
		this.mbtiCampName = mbtiCampName;
		this.mbtiCampInfo = mbtiCampInfo;
		this.mbtiCampLoc = mbtiCampLoc;
		this.mbtiCampPic = mbtiCampPic;
	}

	public String getMbtiType() {
		return mbtiType;
	}

	public void setMbtiType(String mbtiType) {
		this.mbtiType = mbtiType;
	}

	public String getMbtiInfo() {
		return mbtiInfo;
	}

	public void setMbtiInfo(String mbtiInfo) {
		this.mbtiInfo = mbtiInfo;
	}

	public String getMbtiCampName() {
		return mbtiCampName;
	}

	public void setMbtiCampName(String mbtiCampName) {
		this.mbtiCampName = mbtiCampName;
	}

	public String getMbtiCampInfo() {
		return mbtiCampInfo;
	}

	public void setMbtiCampInfo(String mbtiCampInfo) {
		this.mbtiCampInfo = mbtiCampInfo;
	}

	public String getMbtiCampLoc() {
		return mbtiCampLoc;
	}

	public void setMbtiCampLoc(String mbtiCampLoc) {
		this.mbtiCampLoc = mbtiCampLoc;
	}

	public String getMbtiCampPic() {
		return mbtiCampPic;
	}

	public void setMbtiCampPic(String mbtiCampPic) {
		this.mbtiCampPic = mbtiCampPic;
	}
	
}
