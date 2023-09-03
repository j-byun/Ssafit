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

import com.ssafy.ssafit.model.dto.Video;
import com.ssafy.ssafit.model.service.VideoService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/videoapi")
@Api(tags = "비디오 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class VideoRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private VideoService vs;

	// 1. 전체 영상 리스트 조회
	// GET localhost:9999/videoapi/video
	@GetMapping("/video")
	@ApiOperation(value = "전체 영상 목록 조회", notes = "등록된 모든 영상 정보를 반환합니다.")
	public ResponseEntity<?> list() {
		try {
			List<Video> videos = vs.getVideoList();

			if (videos == null || videos.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 선택된 비디오의 상세정보 조회
	// GET localhost:9999/videoapi/video/{no}
	@GetMapping("/video/{no}")
	@ApiOperation(value = "비디오 상세 정보 조회", notes = "no에 해당하는 비디오 정보를 반환합니다.")
	public ResponseEntity<?> detail(@PathVariable int no) {
		try {
			Video video = vs.getVideo(no);

			if (video == null)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<Video>(video, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 3. 비디오 좋아요 수 1만큼 증가/감소
	// PUT localhost:9999/videoapi/video/{no}
	@PutMapping("/video/{no}")
	@ApiOperation(value = "좋아요 수 증가/감소", notes = "{no}에 해당하는 비디오의 좋아요 수를 1만큼 업데이트 합니다.")
	public ResponseEntity<?> getLikeCnt(@RequestParam String mode, @PathVariable String no) {
		try {
			HashMap<String, String> params = new HashMap<String, String>();

			params.put("mode", mode);
			params.put("no", no);

			int result = vs.getLikeCnt(params);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 4. 내가 좋아요 한 영상 리스트 조회
	// GET localhost:9999/videoapi/video/likelist/{userNo}
	@GetMapping("/video/likelist/{userNo}")
	@ApiOperation(value = "사용자가 좋아요 한 영상 목록 조회", notes = "현재 사용자가 좋아요 한 영상 정보를 반환합니다.")
	public ResponseEntity<?> likeList(@PathVariable int userNo) {
		try {
			List<Video> videos = vs.getMyLikeList(userNo);

			if (videos == null || videos.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<Video>>(videos, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
