package com.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

public class AESEncrypt {
	
	private static SecretKey key;
	private String path;
	
	public AESEncrypt() {
		this.path=AESEncrypt.class.getResource("/").getPath();
		this.path=this.path.substring(0,this.path.indexOf("classes"));
		
		File f=new File(this.path+"/bslove.bs");
		
		if(f.exists()) {
			try(ObjectInputStream ois=new ObjectInputStream(new FileInputStream(f))){
				key=(SecretKey)ois.readObject();
			}catch(IOException|ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}else {
			generateKey();
		}
	}
	
	private void generateKey() {
		SecureRandom ser=new SecureRandom();
		KeyGenerator keygen=null;
		try {
			keygen=KeyGenerator.getInstance("AES");
			keygen.init(128,ser);
			AESEncrypt.key=keygen.generateKey();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		File f=new File(this.path+"bslove.bs");
		try(ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(f))){
			oos.writeObject(AESEncrypt.key);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String value) throws NoSuchAlgorithmException,NoSuchPaddingException,InvalidKeyException,BadPaddingException,IllegalBlockSizeException{
		Cipher cipher=Cipher.getInstance("AES");
		//암호화
		cipher.init(Cipher.ENCRYPT_MODE, AESEncrypt.key);
		
		byte[] nativeVal=value.getBytes(Charset.forName("utf-8"));
		byte[] encResult=cipher.doFinal(nativeVal);
		
		return Base64.getEncoder().encodeToString(encResult);
	}
	
	public static String decrypt(String value) throws NoSuchAlgorithmException,NoSuchPaddingException,InvalidKeyException,BadPaddingException,IllegalBlockSizeException{
		Cipher cipher=Cipher.getInstance("AES");
		//복호화
		cipher.init(Cipher.DECRYPT_MODE, AESEncrypt.key);
		
		byte[] decodeStr=Base64.getDecoder().decode(value.getBytes(Charset.forName("utf-8")));
		byte[] decrResult=cipher.doFinal(decodeStr);
		
		return new String(decrResult);
	}
}
