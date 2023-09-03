package com.ssafy.ssafit.model.dto;

public class Review {
	
	private int no;
	private int videoNo;
	private int writerNo;
	private String context;
	private String regDate;
	private int modified; // boolean. false 0 true 1

	
	public Review() {
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getModified() {
		return modified;
	}
	public void setModified(int modified) {
		this.modified = modified;
	}
	
	
}
