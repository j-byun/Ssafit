package com.ssafy.ssafit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.FollowDao;
import com.ssafy.ssafit.model.dto.Follow;

@Service
public class FollowServiceImpl implements FollowService{

	// 필드에 의존성 주입
	@Autowired
	private FollowDao followDao;
	
	@Override
	public int addFollow(Follow follow) {
		return followDao.insertFollow(follow);
	}

	@Override
	public int removeFollow(Follow follow) {
		return followDao.deleteFollow(follow);
	}

}
