package com.ssafy.ssafit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.Board;
import com.ssafy.ssafit.model.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/boardapi")
@Api(tags = "게시판 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class BoardRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private BoardService bs;

	// 1. 게시글 등록하기
	// POST localhost:9999/boardapi/board
	@PostMapping("/board")
	@ApiOperation(value = "게시글 등록하기", notes = "새로운 게시글을 등록합니다.")
	public ResponseEntity<String> write(Board board) {
		try {
			int result = bs.writeBoard(board);
			// result 가 0 이면 등록 x, 1이면 등록 되었다.

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 전체 게시글 리스트 가져오기
	// GET localhost:9999/boardapi/board
	@GetMapping("/board")
	@ApiOperation(value = "전체 게시글 목록 조회", notes = "등록된 모든 게시글 정보를 반환합니다.")
	public ResponseEntity<?> list() {
		try {
			List<Board> boards = bs.getBoardList();

			if (boards == null || boards.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

//	 // 검색 조건 달거면 이거 써
//	@GetMapping("/board")
//	public ResponseEntity<List<Board>> list(@RequestParam(defaultValue = "") String mode,
//			@RequestParam(defaultValue = "") String keyword) {
//		HashMap<String, String> params = new HashMap<String, String>();
//
//		params.put("mode", mode);
//		params.put("keyword", keyword);
//
//		return new ResponseEntity<List<Board>>(boardService.getBoardList(params), HttpStatus.OK);
//	}

	// 3. 게시글 상세정보 조회하기
	// GET localhost:9999/boardapi/board/{no}
	@GetMapping("/board/{no}")
	@ApiOperation(value = "게시글 상세정보 조회", notes = "no에 해당하는 게시글 상세정보를 반환합니다.")
	public ResponseEntity<?> detail(@PathVariable int no) {
		try {
			Board board = bs.getBoard(no);

			if (board == null)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<Board>(board, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 4. 게시글 삭제하기
	// DELETE localhost:9999/boardapi/board/{no}
	@DeleteMapping("/board/{no}")
	@ApiOperation(value = "게시글 삭제하기", notes = "no에 해당하는 게시글 정보를 삭제합니다.")
	public ResponseEntity<?> delete(@PathVariable int no) {
		try {
			int result = bs.removeBoard(no);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 5. 게시글 수정하기
	// PUT localhost:9999/boardapi/board/{no}
	@PutMapping("/board/{no}")
	@ApiOperation(value = "게시글 수정하기", notes = "no에 해당하는 게시글 정보를 수정합니다.")
	public ResponseEntity<String> update(Board board) {
		try {
			int result = bs.modifyBoard(board);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 6. 내가 작성한 게시글 목록 조회하기
	// GET localhost:9999/boardapi/board/myboard/{writerNo}
	@GetMapping("board/myboard/{writerNo}")
	@ApiOperation(value = "내가 작성한 게시글 목록 조회", notes = "writerNo유저가 작성한 모든 게시글 정보를 반환합니다.")
	public ResponseEntity<?> myList(@PathVariable int writerNo) {
		try {
			List<Board> boards = bs.getMyBoardList(writerNo);

			if (boards == null || boards.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
