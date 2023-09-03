package com.ssafy.ssafit.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.MessageDao;
import com.ssafy.ssafit.model.dto.Message;

@Service
public class MessageServiceImpl implements MessageService{
	
	// 필드에 의존성 주입
	@Autowired
	private MessageDao messageDao;

	@Override
	public int sendMessage(Message message) {
		return messageDao.insertMessage(message);
	}

	@Override
	public List<Message> getMyMessages(HashMap<String, String> params) {
		return messageDao.selectMyMessages(params);
	}

	@Override
	public Message getMessage(int no) {
		return messageDao.selectOne(no);
	}

	@Override
	public int readMessage(int no) {
		return messageDao.checkMessage(no);
	}
	
}
