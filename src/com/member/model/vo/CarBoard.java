package com.member.model.vo;

public class CarBoard {
	private String carPicName;
	private String carName;
	private int price;
	private String isdel;
	private int carTotal;
	private int carPsb;
	
	
	public CarBoard() {
		// TODO Auto-generated constructor stub
	}


	public CarBoard(String carPicName, String carName, int price, String isdel, int carTotal, int carPsb) {
		super();
		this.carPicName = carPicName;
		this.carName = carName;
		this.price = price;
		this.isdel = isdel;
		this.carTotal = carTotal;
		this.carPsb = carPsb;
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


	


	

	

	
}
