package com.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;
//나만의 리네임규칙 적용하기
public class MyRenameFile implements FileRenamePolicy {
	@Override
	public File rename(File oldFile) {
		File newFile=null; 
		
		do {
			long currentTime=System.currentTimeMillis();//현재시간을 밀리세컨초로 받아옴
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSSS");
			int rnd=(int)(Math.random()*1320);
			String oriName=oldFile.getName();//업로드된 파일명
			//확장자
			int dot=oriName.lastIndexOf(".");
			String ext="";
			if(dot!=-1) {
				ext=oriName.substring(dot);
			}
			
			//새이름 설정하기
			String newName=sdf.format(new Date(currentTime))+"_"+rnd+ext;
			
			newFile=new File(oldFile.getParent(),newName);
		}while(!createNewFile(newFile));
		return newFile;
	}
	
	private boolean createNewFile(File newFile) {
		try {
			return newFile.createNewFile();//파일생성하기
		}catch(IOException e) {
			return false;
		}
	}
}
