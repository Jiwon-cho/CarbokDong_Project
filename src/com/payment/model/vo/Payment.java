package com.payment.model.vo;

import java.util.Date;

public class Payment {
	private String paymentsNo;
	private String paymetType;
	private Date paymentDate;
	private Date startDate;
	private Date endDate;
	private int price;
	private int productNb;
	private String memberId;
	private String productNm;
	private String opinion;
	
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(String paymentsNo, String paymetType, Date paymentDate, Date startDate, Date endDate, int price,
			int productNb, String memberId, String productNm) {
		super();
		this.paymentsNo = paymentsNo;
		this.paymetType = paymetType;
		this.paymentDate = paymentDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.productNb = productNb;
		this.memberId = memberId;
		this.productNm = productNm;
	}
	public String getPaymentsNo() {
		return paymentsNo;
	}
	public void setPaymentsNo(String paymentsNo) {
		this.paymentsNo = paymentsNo;
	}
	public String getPaymetType() {
		return paymetType;
	}
	public void setPaymetType(String paymetType) {
		this.paymetType = paymetType;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getProductNb() {
		return productNb;
	}
	public void setProductNb(int productNb) {
		this.productNb = productNb;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProductNm() {
		return productNm;
	}
	public void setProductNm(String productNm) {
		this.productNm = productNm;
	}
	
	public String getOpinion() {
		return opinion;
	}
	public void setOpinon(String opinion) {
		this.opinion = opinion;
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "Payment [paymentsNo=" + paymentsNo + ", paymetType=" + paymetType + ", paymentDate=" + paymentDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", price=" + price + ", productNb=" + productNb
				+ ", memberId=" + memberId + ", productNm=" + productNm + "]";
	}
	
	
	
 
    
    
	
}
