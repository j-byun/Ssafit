package com.ssafy.ssafit.model.dao;

import java.util.HashMap;
import java.util.List;

import com.ssafy.ssafit.model.dto.User;

public interface UserDao {
	
	// 로그인 => 프론트에서 로그인하고 백에서는 jwt 토큰 검증만..? 어케하지
	public void login(User user);
	
	// 로그아웃 => 프론트에서 하면 되지 않을까..?
	public void logout(User user);
	
	// 회원가입
	public int insertUser(User user);
	
	// 사용자 정보 하나 가져오기
	public User selectOne(int no);
	
	// 전체 사용자 목록 가져오기
	public List<User> selectAll();
	
	// 회원정보 수정
	public int updateUser(User user);
	
	// 경험치 업데이트
	public int updateExp(int no, int exp);
	
	// 회원탈퇴
	public int deleteUser(int no);
	
	// 내가 팔로우 한 / 나를 팔로우 한 사용자 목록 가져오기
	public List<User> selectFollowList(HashMap<String, String> params);
}
