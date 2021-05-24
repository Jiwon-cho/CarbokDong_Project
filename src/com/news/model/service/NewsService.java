package com.news.model.service;

import java.util.List;

import com.news.model.dao.NewsDao;
import com.news.model.vo.News;

public class NewsService {
	private static NewsDao dao = NewsDao.getInstance();
	
	
	public  List<News> getNewsList(int cPage){
		List<News> list=dao.getNewsList(cPage);
		return list;
	}
	
	
}
