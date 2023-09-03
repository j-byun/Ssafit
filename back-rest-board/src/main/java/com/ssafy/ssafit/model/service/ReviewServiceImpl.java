package com.ssafy.ssafit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.ReviewDao;
import com.ssafy.ssafit.model.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	// 필드에 의존성 주입
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> getVideoReviews(int videoNo) {
		return reviewDao.selectVideoReviews(videoNo);
	}

	@Override
	public int writeReview(Review review) {
		return reviewDao.insertReview(review);
	}

	@Override
	public int modifyReview(Review review) {
		return reviewDao.updateReview(review);
	}

	@Override
	public int removeReview(int no) {
		return reviewDao.deleteReview(no);
	}

}
