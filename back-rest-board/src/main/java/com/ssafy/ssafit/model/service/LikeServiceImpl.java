package com.ssafy.ssafit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.LikeDao;
import com.ssafy.ssafit.model.dto.Like;

@Service
public class LikeServiceImpl implements LikeService{

	// 필드에 의존성 주입
	@Autowired
	private LikeDao likeDao;
	
	@Override
	public int addLike(Like like) {
		return likeDao.insertLike(like);
	}

	@Override
	public int removeLike(Like like) {
		return likeDao.deleteLike(like);
	}
	
}
