package com.ssafy.ssafit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.Like;
import com.ssafy.ssafit.model.service.LikeService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/likeapi")
@Api(tags = "좋아요 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class LikeRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private LikeService ls;

	// 1. 좋아요 등록하기
	// POST localhost:9999/likeapi/like
	@PostMapping("/like")
	@ApiOperation(value = "좋아요 등록하기", notes = "조회된 동영상에 좋아요를 추가합니다.")
	public ResponseEntity<?> add(@RequestBody Like like) {
		try {
			int result = ls.addLike(like);
			// result 가 0 이면 등록 x, 1이면 등록 되었다.

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 좋아요 삭제하기
	// DELETE localhost:9999/likeapi/like
	@DeleteMapping("/like")
	@ApiOperation(value = "좋아요 취소하기", notes = "조회된 동영상에 추가했던 좋아요를 취소합니다.")
	public ResponseEntity<?> remove(@RequestBody Like like) {
		try {
			int result = ls.removeLike(like);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
