package com.ssafy.ssafit.model.service;

import com.ssafy.ssafit.model.dto.Follow;

public interface FollowService {
	
	// 팔로우 추가하기
	int addFollow(Follow follow);
	
	// 팔로우 삭제하기
	int removeFollow(Follow follow);
}
