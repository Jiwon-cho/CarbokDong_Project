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
		int idx=0;
		int a=0;
		for(int i=0;i<11;i++) {
			for(int j=0;j<11;j++) {
				a=idx+1;
				idx++;
			}
		}

		
	
		System.out.println(a);
		
	}

}
