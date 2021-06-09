package com.news.controller;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

import com.news.model.vo.News;


public class NewsJob implements Job  {
	public void execute(JobExecutionContext context) {
		String url=null;
		int idx=0;
		Document doc=null;
		List<News> list=new ArrayList<News>();
	for(int i=1;i<11;i++) {
		url="http://www.heraldpop.com/search.php?searchvalue=%EC%BA%A0%ED%95%91+%EC%BA%A0%ED%95%91%EC%9E%A5&ACE_SEARCH=1&pg="+i;
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
	}
	
	PreparedStatement pstmt=null;
	
	try {
		
	}catch(Exception e) {
	e.printStackTrace();	
	}
	
		
	}

}
