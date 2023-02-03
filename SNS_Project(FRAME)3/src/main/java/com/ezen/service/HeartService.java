package com.ezen.service;

import java.util.List;

import com.ezen.dto.HeartVO;

public interface HeartService {

	HeartVO like(HeartVO vo);
 
	void insertLike(HeartVO vo);
	
	List<HeartVO> boardLike(HeartVO vo);
	
	void deleteLike(HeartVO vo);
	
	int likeCount(HeartVO vo);
}