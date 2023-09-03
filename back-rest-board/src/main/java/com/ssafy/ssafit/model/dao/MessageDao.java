package com.ssafy.ssafit.model.dao;

import java.util.HashMap;
import java.util.List;

import com.ssafy.ssafit.model.dto.Message;
import com.ssafy.ssafit.model.dto.User;

public interface MessageDao {

	// 메세지 등록하기
	public int insertMessage(Message message);
	
	// 나에게 온/ 내가 보낸 전체 메세지 조회하기
	public List<Message> selectMyMessages(HashMap<String, String> params);
	
	// 메세지 하나의 상세정보 가져오기
	public Message selectOne(int no);
	
	// 메세지 읽음 표시하기
	public int checkMessage(int no);
	
}
