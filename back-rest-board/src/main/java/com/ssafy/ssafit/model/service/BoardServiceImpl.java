package com.ssafy.ssafit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ssafit.model.dao.BoardDao;
import com.ssafy.ssafit.model.dto.Board;

@Service
public class BoardServiceImpl implements BoardService{

	// 필드에 의존성 주입
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int writeBoard(Board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public List<Board> getBoardList() {
		return boardDao.selectAll();
	}

	@Override
	public Board getBoard(int no) {
		return boardDao.selectOne(no);
	}

	@Override
	public int removeBoard(int no) {
		return boardDao.deleteBoard(no);
	}

	@Override
	public int modifyBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public List<Board> getMyBoardList(int writerNo) {
		return boardDao.selectMyBoardList(writerNo);
	}
	
}
