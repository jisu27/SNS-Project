package com.ezen.service;

import java.util.List;

import com.ezen.dto.HeartVO;

public interface HeartService {

	HeartVO like(HeartVO vo);

	void insertLike(HeartVO vo);

	List<HeartVO> boardLike(HeartVO vo);

	void deleteLike(HeartVO vo);

	void deleteLike_c(HeartVO vo);

	int likeCount(HeartVO vo);

	List<Integer> commentLike(HeartVO vo);

	int likeCommentCount(HeartVO vo);

	List<HeartVO> shortsLike(HeartVO vo);

	int likeShortsCount(HeartVO vo);
}