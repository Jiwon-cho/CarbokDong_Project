package com.member.model.vo;

import java.util.Date;

public class CarBoard {
	private int rnum;
	private int carIdx;
	private String carPicName;
	private String carName;
	private int price;
	private String isdel;
	private int carTotal;
	private int carPsb;
	private Date startDate;
	private Date endDate;
	private String gear;
	private int carNB;
	public CarBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CarBoard(int carIdx, String carPicName, String carName, int price, String isdel, int carTotal, int carPsb,
			Date startDate, Date endDate, String gear) {
		super();
		this.carIdx = carIdx;
		this.carPicName = carPicName;
		this.carName = carName;
		this.price = price;
		this.isdel = isdel;
		this.carTotal = carTotal;
		this.carPsb = carPsb;
		this.startDate = startDate;
		this.endDate = endDate;
		this.gear = gear;
	}
	public int getCarIdx() {
		return carIdx;
	}
	public void setCarIdx(int carIdx) {
		this.carIdx = carIdx;
	}
	public String getCarPicName() {
		return carPicName;
	}
	public void setCarPicName(String carPicName) {
		this.carPicName = carPicName;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	public int getCarTotal() {
		return carTotal;
	}
	public void setCarTotal(int carTotal) {
		this.carTotal = carTotal;
	}
	public int getCarPsb() {
		return carPsb;
	}
	public void setCarPsb(int carPsb) {
		this.carPsb = carPsb;
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
	public String getGear() {
		return gear;
	}
	public void setGear(String gear) {
		this.gear = gear;
	}
	public int getCarNB() {
		return carNB;
	}
	public void setCarNB(int carNB) {
		this.carNB = carNB;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
	
	@Override
	public String toString() {
		return "CarBoard [carIdx=" + carIdx + ", carPicName=" + carPicName + ", carName=" + carName + ", price=" + price
				+ ", isdel=" + isdel + ", carTotal=" + carTotal + ", carPsb=" + carPsb + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", gear=" + gear + "]";
	}
	
	
	
	

	


	


	

	

	
}
