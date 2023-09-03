package com.ssafy.ssafit.model.dao;

import com.ssafy.ssafit.model.dto.Follow;

public interface FollowDao {
	
	// 팔로우 추가하기
	public int insertFollow(Follow follow);
	
	// 팔로우 삭제하기
	public int deleteFollow(Follow follow);
	
}
