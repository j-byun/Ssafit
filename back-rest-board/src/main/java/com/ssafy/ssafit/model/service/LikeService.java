package com.ssafy.ssafit.model.service;

import com.ssafy.ssafit.model.dto.Like;

public interface LikeService {

	// 좋아요 등록하기
	int addLike(Like like);

	// 좋아요 삭제하기
	int removeLike(Like like);
}
