package com.ssafy.ssafit.model.dto;

public class Board {
	private int no;
	private int writerNo;
	private String title;
	private String context;
	private String regDate;
	private int viewCnt;

	public Board() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", writerNo=" + writerNo + ", title=" + title + ", context=" + context + ", regDate="
				+ regDate + ", viewCnt=" + viewCnt + "]";
	}
}
