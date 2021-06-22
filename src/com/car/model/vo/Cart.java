package com.car.model.vo;

import java.util.Date;

public class Cart {
	private int cartIdx;
	private String isDel;
	private int productNb;
	private Date rent_start_date;
	private Date rent_end_date;
	private String memberId;
	private int cartPrice;
	private String gear;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cartIdx, String isDel, int productNb, Date rent_start_date, Date rent_end_date, String memberId,
			int cartPrice, String gear) {
		super();
		this.cartIdx = cartIdx;
		this.isDel = isDel;
		this.productNb = productNb;
		this.rent_start_date = rent_start_date;
		this.rent_end_date = rent_end_date;
		this.memberId = memberId;
		this.cartPrice = cartPrice;
		this.gear = gear;
	}
	public int getCartIdx() {
		return cartIdx;
	}
	public void setCartIdx(int cartIdx) {
		this.cartIdx = cartIdx;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public int getProductNb() {
		return productNb;
	}
	public void setProductNb(int productNb) {
		this.productNb = productNb;
	}
	public Date getRent_start_date() {
		return rent_start_date;
	}
	public void setRent_start_date(Date rent_start_date) {
		this.rent_start_date = rent_start_date;
	}
	public Date getRent_end_date() {
		return rent_end_date;
	}
	public void setRent_end_date(Date rent_end_date) {
		this.rent_end_date = rent_end_date;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	public String getGear() {
		return gear;
	}
	public void setGear(String gear) {
		this.gear = gear;
	}
	@Override
	public String toString() {
		return "Cart [cartIdx=" + cartIdx + ", isDel=" + isDel + ", productNb=" + productNb + ", rent_start_date="
				+ rent_start_date + ", rent_end_date=" + rent_end_date + ", memberId=" + memberId + ", cartPrice="
				+ cartPrice + ", gear=" + gear + "]";
	}
	
	
	
	
	
	
	
}
