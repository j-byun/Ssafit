package com.ssafy.ssafit.model.dao;

import java.util.HashMap;
import java.util.List;

import com.ssafy.ssafit.model.dto.Video;

public interface VideoDao {
	
	// 전체 비디오 리스트 가져오기
	public List<Video> selectAll();
	
	// 비디오 하나 조회
	public Video selectOne(int no);
	
	// 좋아요 수 1 증가/감소하기
	public int updateLikeCnt(HashMap<String, String> params);
	
	// 내가 좋아요 한 비디오 리스트 가져오기
	public List<Video> selectMyLikeList(int userNo);
}
