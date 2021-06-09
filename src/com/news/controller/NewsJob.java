package com.news.controller;
import static com.common.JDBCTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.common.JDBCTemplate.close;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.quartz.Job;
import org.quartz.JobExecutionContext;

import com.news.model.vo.News;


public class NewsJob implements Job  {
private Properties prop=new Properties();
	

	private NewsJob() {
		String path=NewsJob.class.getResource("/sql/news_sql.properties").getPath();
	
		try {
			prop.load(new FileReader(path));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
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
	Connection conn=getConnection();
	
	try {
		pstmt=conn.prepareStatement(prop.getProperty("insertNews"));
		for(News n:list) {
			pstmt.setInt(1,n.getNewsNo());
			pstmt.setString(2, n.getNewsTitle());
			pstmt.setString(3, n.getImgUrl());
			pstmt.setString(4, n.getNewsPrev());
			pstmt.setString(5,n.getNewsDate());
			pstmt.setString(6, n.getNewsUrl());
			pstmt.executeUpdate();
		}
		
	}catch(Exception e) {
	e.printStackTrace();	
	}finally {
		close(pstmt);
	}
	
		
	}

}
