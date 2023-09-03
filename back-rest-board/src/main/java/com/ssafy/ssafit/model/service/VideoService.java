package com.ssafy.ssafit.model.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.ssafit.model.dto.Video;

public interface VideoService {

	// 전체 비디오 리스트 조회
	List<Video> getVideoList();
	
	// 비디오 하나 조회
	Video getVideo(int no);
	
	// 좋아요 +1, -1
	int getLikeCnt(HashMap<String, String> params);
	
	// 내가 좋아요 한 비디오 리스트 가져오기
	List<Video> getMyLikeList(int userNo);
}
