package com.car.model.vo;

public class CarFile {
	private String carPicNm;
	private int carPicNb;
	
	public CarFile() {
		// TODO Auto-generated constructor stub
	}

	public CarFile(String carPicNm, int carPicNb) {
		super();
		this.carPicNm = carPicNm;
		this.carPicNb = carPicNb;
	}

	public String getCarPicNm() {
		return carPicNm;
	}

	public void setCarPicNm(String carPicNm) {
		this.carPicNm = carPicNm;
	}

	public int getCarPicNb() {
		return carPicNb;
	}

	public void setCarPicNb(int carPicNb) {
		this.carPicNb = carPicNb;
	}
	
	
}
