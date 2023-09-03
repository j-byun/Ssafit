package com.ssafy.ssafit.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.User;
import com.ssafy.ssafit.model.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/userapi")
@Api(tags = "유저 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class UserRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private UserService us;

	// 1. 회원가입
	// POST localhost:9999/userapi/user
	@PostMapping("/user")
	@ApiOperation(value = "회원가입", notes = "새로운 사용자 정보를 등록합니다.")
	public ResponseEntity<String> signup(@RequestBody User user) {
		try {
			int result = us.signup(user);
			// result 가 0 이면 등록 x, 1이면 등록 되었다.

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 선택된 회원의 상세정보 조회
	// GET localhost:9999/userapi/user/{no}
	@GetMapping("/user/{no}")
	@ApiOperation(value = "사용자 상세 정보 조회", notes = "no에 해당하는 사용자 정보를 반환합니다.")
	public ResponseEntity<?> detail(@PathVariable int no) {
		try {
			User user = us.getUser(no);

			if (user == null)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<User>(user, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 3. 전체 사용자 목록 조회
	// GET localhost:9999/userapi/user
	@GetMapping("/user")
	@ApiOperation(value = "전체 사용자 목록 조회", notes = "등록된 모든 사용자 정보를 반환합니다.")
	public ResponseEntity<?> list() {
		try {
			List<User> users = us.getUserList();
			if (users == null || users.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<User>>(users, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	// 4. 회원정보 수정
	// PUT localhost:9999/userapi/user
	@PutMapping("/user")
	@ApiOperation(value = "회원정보 수정", notes = "사용자의 정보를 수정합니다.")
	public ResponseEntity<?> update(@RequestBody User user) {
		try {
			int result = us.modifyUser(user);
			
			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 5. 사용자 경험치 획득
	// PUT localhost:9999/userapi/user/{no}
	@PutMapping("/user/{no}")
	@ApiOperation(value = "사용자 경험치 획득", notes = "{no}에 해당하는 사용자의 경험치를 업데이트 합니다.")
	public ResponseEntity<?> getExp(@PathVariable int no, int exp) {
		try {
			int result = us.getExp(no, exp);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 6. 회원탈퇴
	// DELETE localhost:9999/userapi/user/{no}
	@DeleteMapping("/user/{no}")
	@ApiOperation(value = "회원탈퇴", notes = "{no}에 해당하는 사용자 정보를 삭제합니다.")
	public ResponseEntity<?> withdraw(@PathVariable int no) {
		try {
			int result = us.withdraw(no);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 7. 내가 팔로우 한 / 나를 팔로우 한 사용자 목록 조회
	// GET localhost:9999/userapi/user/follow/{userNo}
	@GetMapping("/user/follow/{userNo}")
	@ApiOperation(value = "팔로우 사용자 목록 조회", notes = "내가 팔로우 한 / 나를 팔로우 한 사용자 정보를 반환합니다.")
	public ResponseEntity<?> followList(@RequestParam String mode, @PathVariable String userNo) {
		try {
			HashMap<String, String> params = new HashMap<String, String>();

			params.put("mode", mode);
			params.put("userNo", userNo);
			
			List<User> users = us.getFollowList(params);
			
			if (users == null || users.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<User>>(users, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
