package com.ezen.service;

import java.util.List;

import com.ezen.dto.ShortsCommentVO;

public interface ShortsCommentService {

	void insertShortsComment(ShortsCommentVO vo);

	void updateShortsComment(ShortsCommentVO vo);

	void deleteShortsComment(ShortsCommentVO vo);

	List<ShortsCommentVO> getShortsCommentList(int sSeq);

	ShortsCommentVO getShortsComment(ShortsCommentVO vo);
	
	int getCountShortsCommentList(int s_seq);

}