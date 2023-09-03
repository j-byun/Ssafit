package com.ssafy.ssafit.model.service;

import java.util.List;

import com.ssafy.ssafit.model.dto.Board;

public interface BoardService {
	
	// 게시글 등록하기
	int writeBoard(Board board);

	// 게시글 전체 목록 가져오기
	List<Board> getBoardList();

	// 게시글 하나의 상세정보 가져오기
	Board getBoard(int no);

	// 게시글 삭제하기
	int removeBoard(int no);

	// 게시글 수정하기
	int modifyBoard(Board board);
	
	// 내가 작성한 게시글 목록 조회하기
	List<Board> getMyBoardList(int writerNo);
}
