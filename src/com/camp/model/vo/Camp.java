package com.camp.model.vo;

public class Camp {

	private String name;
	private double latitude;
	private double longitude;
	private int price;
	private int rating;
	
	public Camp() {}
	
	public Camp(String name, double latitude, double longitude, int price, int rating) {
		super();
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.price = price;
		this.rating = rating;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
	
}
