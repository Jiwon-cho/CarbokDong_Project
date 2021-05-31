package com.camp.model.vo;

public class Camp {
	
	private int num;
	private String name;
	private String location;
	private String info;
	private double latitude;
	private double longitude;
	
	public Camp() {}
	
	
	public Camp(int num, String name, String location, String info, double latitude, double longitude) {
		super();
		this.num = num;
		this.name = name;
		this.location = location;
		this.info = info;
		this.latitude = latitude;
		this.longitude = longitude;
	}


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	
}
