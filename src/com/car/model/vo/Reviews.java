package com.car.model.vo;

public class Reviews {
	
	private int reviewNb;
	private String reviewContents;
	private int rating;
	private String memberId;
	private int carNb;
	private String fileName;
	
	public Reviews() {
		// TODO Auto-generated constructor stub
	}

	public Reviews(int reviewNb, String reviewContents, int rating, String memberId, int carNb, String fileName) {
		super();
		this.reviewNb = reviewNb;
		this.reviewContents = reviewContents;
		this.rating = rating;
		this.memberId = memberId;
		this.carNb = carNb;
		this.fileName = fileName;
	}

	public int getReviewNb() {
		return reviewNb;
	}

	public void setReviewNb(int reviewNb) {
		this.reviewNb = reviewNb;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCarNb() {
		return carNb;
	}

	public void setCarNb(int carNb) {
		this.carNb = carNb;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
