package com.ssafy.ssafit.model.dto;

public class Follow {
	private int no;
	private int followee;
	private int follower;
	private String followDate;
	
	public Follow() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFollowee() {
		return followee;
	}

	public void setFollowee(int followee) {
		this.followee = followee;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public String getFollowDate() {
		return followDate;
	}

	public void setFollowDate(String followDate) {
		this.followDate = followDate;
	}

}
