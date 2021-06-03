package com.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.common.AESEncrypt;

public class EncryptWrapper extends HttpServletRequestWrapper {
	
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String value = null;
		
		if(name.equals("password")||name.equals("password_new")) {
			
			System.out.println("암호화전 : "+super.getParameter(name));
			value=getSHA512(super.getParameter(name));
			System.out.println("암호화후 : "+value);
			
		}else {
			value=super.getParameter(name);
		}
		
		return value;
	}
	
	private String getSHA512(String val) {
		String encValue;
		//암호화
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=val.getBytes(Charset.forName("utf-8"));
		md.update(bytes);
		encValue=Base64.getEncoder().encodeToString(md.digest());
		return encValue;
	}
}



