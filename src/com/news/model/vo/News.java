package com.news.model.vo;

import java.util.Date;

public class News {
	private int newsNo;
	private String newsTitle;
	private String newsWriter;
	private String newsDate;
	private int newsReadCount;
	private String newsContent;
	private String newsPrev;
	private String imgUrl;
	
	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
	public News(int newsNo, String newsTitle, String newsWriter, String newsDate, int newsReadCount, String newsContent,
			String newsPrev, String imgUrl) {
		super();
		this.newsNo = newsNo;
		this.newsTitle = newsTitle;
		this.newsWriter = newsWriter;
		this.newsDate = newsDate;
		this.newsReadCount = newsReadCount;
		this.newsContent = newsContent;
		this.newsPrev = newsPrev;
		this.imgUrl = imgUrl;
	}
	public int getNewsNo() {
		return newsNo;
	}
	public void setNewsNo(int newsNo) {
		this.newsNo = newsNo;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsWriter() {
		return newsWriter;
	}
	public void setNewsWriter(String newsWriter) {
		this.newsWriter = newsWriter;
	}
	public String getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}
	public int getNewsReadCount() {
		return newsReadCount;
	}
	public void setNewsReadCount(int newsReadCount) {
		this.newsReadCount = newsReadCount;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsPrev() {
		return newsPrev;
	}
	public void setNewsPrev(String newsPrev) {
		this.newsPrev = newsPrev;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "News [newsNo=" + newsNo + ", newsTitle=" + newsTitle + ", newsWriter=" + newsWriter + ", newsDate="
				+ newsDate + ", newsReadCount=" + newsReadCount + ", newsContent=" + newsContent + ", newsPrev="
				+ newsPrev + ", imgUrl=" + imgUrl + "]";
	}
	
	
	
	
	
}
