package com.ezen.service;

import java.util.List;

import com.ezen.dto.ShortsCommentVO;

public interface ShortsCommentService {

	void insertComment(ShortsCommentVO vo);

	void updateComment(ShortsCommentVO vo);

	void deleteComment(ShortsCommentVO vo);

	List<ShortsCommentVO> getCommentList(ShortsCommentVO vo);

	ShortsCommentVO getComment(ShortsCommentVO vo);
	
	int getCountCommentList(int s_seq);

}