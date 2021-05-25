package com.news.model.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.news.model.vo.News;

public class NewsDao {
		private static NewsDao newsDao;
		

	private NewsDao() {
	}

	public static NewsDao getInstance() {
		try {
			if (newsDao == null) {
				newsDao = new NewsDao();
			}
			return newsDao;
		} catch (Exception e) {
			throw new RuntimeException("[Error: Creating instance fail : " + e.getMessage() + "]");
		}
	}
	
	
	public List<News> getNewsList(int cPage){
		String url=null;
		int idx=0;
		Document doc=null;
		List<News> list=new ArrayList<News>();
	
		url="http://www.heraldpop.com/search.php?searchvalue=%EC%BA%A0%ED%95%91+%EC%BA%A0%ED%95%91%EC%9E%A5&ACE_SEARCH=1&pg="+cPage;
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException	 e) {
			throw new RuntimeException("[Error: Crawling fail : " + e.getMessage() + "]");
		}
		Elements articles=doc.select("#content > div.slist > dl");		
		for(Element el : articles) {
			News n=new News();
			n.setNewsNo(idx+1);
			n.setNewsTitle(el.select("dd > a > h2").text());
			n.setImgUrl(el.select("dt > a > img").attr("src"));
			n.setNewsPrev(el.select("dd > a > p").text());
			n.setNewsDate(el.select("dd > span").text());
			n.setNewsUrl(el.select("dt > a").attr("href"));
			idx++;
			list.add(n);
		}
	
	return list;
	}
	
	
	
	
	
	public News selectNewsView(int newsNo, int cPage) {
		List<News> list=getNewsList(cPage);
		String url=null;
		for(News n: list) {
			if(n.getNewsNo()==newsNo) {
				url=n.getNewsUrl();
			}
		}
		
		Document doc=null;
		try {
			doc = Jsoup.connect(url).get();
		}catch(IOException	 e) {
			throw new RuntimeException("[Error: Crawling fail : " + e.getMessage() + "]");
		}
		Elements title=doc.select("#content > div.article > div.top > div.title > h1");
		Elements images=doc.select("#CmAdContent > div > div > img");
		Elements contents=doc.select("#CmAdContent");
		News n=new News();
		
		
		String src="";
		for(Element el: images) {
			src+=el.attr("src")+",";
			
		}
		n.setImgUrl(src);
		

		for(Element el: title) {
			n.setNewsTitle(el.text());
		}
		
		for(Element el: contents) {
			n.setNewsContent(el.text());
		}
		
		return n;
	}
	
	
	

}
