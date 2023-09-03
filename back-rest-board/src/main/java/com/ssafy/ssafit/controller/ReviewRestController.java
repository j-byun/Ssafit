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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.ssafit.model.dto.Review;
import com.ssafy.ssafit.model.service.ReviewService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/reviewapi")
@Api(tags = "리뷰 컨트롤러")
//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE })
public class ReviewRestController {

	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private ReviewService rs;

	// 1. 조회된 비디오의 전체 리뷰 리스트 가져오기
	// GET localhost:9999/reviewapi/review/{videoNo}
	@GetMapping("/review/{videoNo}")
	@ApiOperation(value = "비디오에 등록된 전체 리뷰 리스트 조회", notes = "videoNo에 해당하는 비디오에 등록된 전체 리뷰 리스트를 반환합니다.")
	public ResponseEntity<?> list(@PathVariable int videoNo) {
		try {
			List<Review> reviews = rs.getVideoReviews(videoNo);

			if (reviews == null || reviews.size() == 0)
				return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
			return new ResponseEntity<List<Review>>(reviews, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 2. 리뷰 등록하기
	// POST localhost:9999/reviewapi/review
	@PostMapping("/review")
	@ApiOperation(value = "리뷰 등록하기", notes = "조회된 동영상에 새로운 리뷰를 등록합니다.")
	public ResponseEntity<?> write(@RequestBody Review review) {
		try {
			int result = rs.writeReview(review);
			// result 가 0 이면 등록 x, 1이면 등록 되었다.

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.CREATED);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 3. 리뷰 수정하기
	// PUT localhost:9999/reviewapi/review/{no}
	@PutMapping("/review/{no}")
	@ApiOperation(value = "리뷰 수정하기", notes = "{no}에 해당하는 리뷰의 내용을 수정합니다.")
	public ResponseEntity<?> update(@RequestBody Review review) {
		try {
			int result = rs.modifyReview(review);

			if (result == 1)
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}

	// 4. 리뷰 삭제하기
	// DELETE localhost:9999/reviewapi/review/{no}
	@DeleteMapping("/review/{no}")
	@ApiOperation(value = "리뷰 삭제하기", notes = "{no}에 해당하는 리뷰 정보를 삭제합니다.")
	public ResponseEntity<?> delete(@PathVariable int no) {
		try {
			int result = rs.removeReview(no);

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
