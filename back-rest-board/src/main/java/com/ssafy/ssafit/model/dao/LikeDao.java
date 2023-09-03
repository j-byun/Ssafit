package com.ssafy.ssafit.model.dao;

import com.ssafy.ssafit.model.dto.Like;

public interface LikeDao {
	
	// 좋아요 등록하기
	public int insertLike(Like like);
	
	// 좋아요 삭제하기
	public int deleteLike(Like like);
	
}
