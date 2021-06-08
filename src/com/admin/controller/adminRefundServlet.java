package com.admin.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class adminRefundServlet
 */
@WebServlet("/admin/refund")
public class adminRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminRefundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpURLConnection conn=null;
		String access_token=null;
		JSONParser parser = new JSONParser();
		Object ob =null;
	try {	
		URL url=new URL("https://api.iamport.kr/users/getToken");
		conn=(HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		
		
		conn.setDoOutput(true);
		
		JSONObject obj=new JSONObject();
		obj.put("imp_key", "0013180723610334");
		obj.put("imp_secret", "kH3vbz6fDjzKcCutXaz1vTsstAi1NbO7SRC4rJj52TPevjHtuhv0bXsEyKGmVvuOn7SOQcUT5J8B3Q4x");
		
		BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
	
		int result=0;
		int responseCode=conn.getResponseCode();
		System.out.println(responseCode);
		if(responseCode ==200) {
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb=new StringBuilder();
			String line=null;
			while((line=br.readLine())!=null) {
				
				sb.append(line+"\n");
			}
			
			br.close();
			System.out.println(sb);
			System.out.println(sb.getClass().getName());
			System.out.println(sb.toString().getClass().getName());
		System.out.println(""+sb.toString());
		
		ob=parser.parse(sb.toString());
		}
	}catch (MalformedURLException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }catch(Exception e){
    	e.printStackTrace();
    }

	JSONObject jj = (JSONObject) ob;
	
	 response.getWriter().print(jj);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
