package com.ssafy.ssafit.model.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.ssafit.model.dto.Message;
import com.ssafy.ssafit.model.dto.User;

public interface MessageService {
	
	// 메세지 보내기
	int sendMessage(Message message);
	
	// 나에게 온/ 내가 보낸 전체 메세지 조회하기
	List<Message> getMyMessages(HashMap<String, String> params);
	
	// 메세지 하나 조회하기
	Message getMessage(int no);
	
	// 메세지 읽음 표시하기
	public int readMessage(int no);
}
