package com.ssafy.ssafit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.Follow;
import com.ssafy.ssafit.model.service.FollowService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/followapi")
@Api(tags = "팔로우 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class FollowRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private FollowService fs;

	// 1. 팔로우 등록하기
	// POST localhost:9999/followapi/follow
	@PostMapping("/follow")
	@ApiOperation(value = "팔로우 등록하기", notes = "다른 사용자를 팔로우합니다.")
	public ResponseEntity<?> add(@RequestBody Follow follow) {
		try {
			int result = fs.addFollow(follow);
			// result 가 0 이면 등록 x, 1이면 등록 되었다.

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 팔로우 삭제하기
	// DELETE localhost:9999/followapi/follow
	@DeleteMapping("/follow")
	@ApiOperation(value = "팔로우 취소하기", notes = "팔로우 했던 사용자를 언팔로우합니다.")
	public ResponseEntity<?> remove(@RequestBody Follow follow) {
		try {
			int result = fs.removeFollow(follow);

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
