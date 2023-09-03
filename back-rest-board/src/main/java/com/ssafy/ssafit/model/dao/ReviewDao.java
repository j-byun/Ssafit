package com.ssafy.ssafit.model.dao;

import java.util.List;

import com.ssafy.ssafit.model.dto.Review;

public interface ReviewDao {
	
	// 조회된 비디오에 등록된 전체 리뷰 리스트 가져오기
	public List<Review> selectVideoReviews(int videoNo);
	
	// 리뷰 등록하기
	public int insertReview(Review review);
	
	// 리뷰 수정하기
	public int updateReview(Review review);
	
	// 리뷰 삭제하기
	public int deleteReview(int no);
	
}
