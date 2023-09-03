package com.ssafy.ssafit.model.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.ssafit.model.dto.User;

public interface UserService {
	
	// 로그인
	User login(User user);
		
	// 로그아웃
	void logout(User user);
		
	// 회원가입
	int signup(User user);
	
	// 사용자 정보 하나 가져오기
	User getUser(int no);
	
	// 전체 사용자 목록 가져오기
	List<User> getUserList();
	
	// 회원정보 수정
	int modifyUser(User user);
	
	// 경험치 업데이트
	int getExp(int no, int add);
		
	// 회원탈퇴
	int withdraw(int no);
	
	// 내가 팔로우 한 / 나를 팔로우 한 사용자 목록 가져오기
	List<User> getFollowList(HashMap<String, String> params);
}
