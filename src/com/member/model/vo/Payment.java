package com.member.model.vo;

import java.util.Date;

public class Payment {
	private int no;
	private String type;
	private Date toDate;
	private Date startDate;
	private Date endDate;
	private int pirce;
	private String productModel;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}

	public Payment(int no, String type, Date toDate, Date startDate, Date endDate, int pirce, String productModel) {
		super();
		this.no = no;
		this.type = type;
		this.toDate = toDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.pirce = pirce;
		this.productModel = productModel;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getPirce() {
		return pirce;
	}

	public void setPirce(int pirce) {
		this.pirce = pirce;
	}

	public String getProductModel() {
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}

	
	
}
