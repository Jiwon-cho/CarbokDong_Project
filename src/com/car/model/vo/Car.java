package com.car.model.vo;

public class Car {
	private int carNB;
	private String carType;	
	private String carModel;
	private int carPpl;
	private int carTotal;
	private int carPsb;
	private String carInfo;
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Car(int carNB, String carType, String carModel, int carPpl, int carTotal, int carPsb, String carInfo) {
		super();
		this.carNB = carNB;
		this.carType = carType;
		this.carModel = carModel;
		this.carPpl = carPpl;
		this.carTotal = carTotal;
		this.carPsb = carPsb;
		this.carInfo = carInfo;
	}
	public int getCarNB() {
		return carNB;
	}
	public void setCarNB(int carNB) {
		this.carNB = carNB;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public int getCarPpl() {
		return carPpl;
	}
	public void setCarPpl(int carPpl) {
		this.carPpl = carPpl;
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
	public String getCarInfo() {
		return carInfo;
	}
	public void setCarInfo(String carInfo) {
		this.carInfo = carInfo;
	}
	@Override
	public String toString() {
		return "Car [carNB=" + carNB + ", carType=" + carType + ", carModel=" + carModel + ", carPpl=" + carPpl
				+ ", carTotal=" + carTotal + ", carPsb=" + carPsb + ", carInfo=" + carInfo + "]";
	}
	
	
	

}
