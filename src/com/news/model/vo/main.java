package com.news.model.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.news.model.dao.NewsDao;

public class main {
	//private static String url="http://pop.heraldcorp.com/view.php?ud=202105232102500066857_1&ACE_SEARCH=1";

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		String url="http://pop.heraldcorp.com/view.php?ud=202105232102500066857_1&ACE_SEARCH=1";
		
		
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
		
		
	
		
		for(Element el: contents) {
			n.setNewsContent(el.html());
		}
	
		System.out.println(n.getNewsContent());
		
	}

}
