package com.borad.model.vo;

public class Files {

	private String fileNm;
	private int boardNb;
	
	public Files() {
		// TODO Auto-generated constructor stub
	}

	public Files(String fileNm, int boardNb) {
		super();
		this.fileNm = fileNm;
		this.boardNb = boardNb;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public int getBoardNb() {
		return boardNb;
	}

	public void setBoardNb(int boardNb) {
		this.boardNb = boardNb;
	}

	@Override
	public String toString() {
		return "Files [fileNm=" + fileNm + ", boardNb=" + boardNb + "]";
	}
	
}
