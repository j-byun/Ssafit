package com.ssafy.ssafit.model.service;

import java.util.List;

import com.ssafy.ssafit.model.dto.Review;

public interface ReviewService {
	
	// 조회된 비디오에 등록된 전체 리뷰 리스트 가져오기
	List<Review> getVideoReviews(int videoNo);
	
	// 리뷰 등록하기
	int writeReview(Review review);
	
	// 리뷰 수정하기
	int modifyReview(Review review);
	
	// 리뷰 삭제하기
	int removeReview(int no);
}
