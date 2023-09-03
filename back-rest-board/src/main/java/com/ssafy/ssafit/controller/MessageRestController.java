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

import com.ssafy.ssafit.model.dto.Message;
import com.ssafy.ssafit.model.service.MessageService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/messageapi")
@Api(tags = "메세지 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class MessageRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private MessageService ms;

	// 1. 메세지 전송하기
	// POST localhost:9999/messageapi/message
	@PostMapping("/message")
	@ApiOperation(value = "메세지 전송하기", notes = "팔로우 중인 사용자에게 메세지를 전송합니다.")
	public ResponseEntity<?> send(@RequestBody Message message) {
		try {
			int result = ms.sendMessage(message);
			// result 가 0 이면 등록 x, 1이면 등록 되었다.

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 나에게 온/ 내가 보낸 전체 메세지 조회하기
	// GET localhost:9999/messageapi/message/mymessage/{userNo}
	@GetMapping("/message/mymessage/{userNo}")
	@ApiOperation(value = "나에게 온/ 내가 보낸 전체 메세지 리스트 조회", notes = "userNo에 해당하는 사용자에게 온/ 사용자가 보낸 전체 메세지 리스트를 반환합니다.")
	public ResponseEntity<?> list(@RequestParam String mode, @PathVariable String userNo) {
		try {
			HashMap<String, String> params = new HashMap<String, String>();

			params.put("mode", mode);
			params.put("userNo", userNo);

			List<Message> messages = ms.getMyMessages(params);

			if (messages == null || messages.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<Message>>(messages, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 3. 선택된 메세지의 상세정보 조회
	// GET localhost:9999/messageapi/message/{no}
	@GetMapping("/message/{no}")
	@ApiOperation(value = "메세지 상세정보 조회", notes = "no에 해당하는 메세지 상세정보를 반환합니다.")
	public ResponseEntity<?> detail(@PathVariable int no) {
		try {
			Message message = ms.getMessage(no);

			if (message == null)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<Message>(message, HttpStatus.OK);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 4. 메세지 읽음 표시하기
	// PUT localhost:9999/messageapi/message/{no}
	@PutMapping("/message/{no}")
	@ApiOperation(value = "메세지 읽음 표시하기", notes = "no에 해당하는 메세지를 읽음 표시합니다.")
	public ResponseEntity<?> check(@PathVariable int no) {
		try {
			int result = ms.readMessage(no);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
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
