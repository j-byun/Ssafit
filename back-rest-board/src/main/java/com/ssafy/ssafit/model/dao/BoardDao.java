package com.ssafy.ssafit.model.dao;

import java.util.List;

import com.ssafy.ssafit.model.dto.Board;

public interface BoardDao {
	// 게시글 등록하기
	public int insertBoard(Board board);

	// 게시글 전체 목록 조회하기
	public List<Board> selectAll();

	// 게시글 하나의 상세정보 조회하기
	public Board selectOne(int no);

	// 게시글 삭제하기
	public int deleteBoard(int no);

	// 게시글 수정하기
	public int updateBoard(Board board);
	
	// 내가 작성한 게시글 목록 조회하기
	public List<Board> selectMyBoardList(int writerNo);
}
