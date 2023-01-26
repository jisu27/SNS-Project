package com.ezen.service;

import java.util.List;

import com.ezen.dto.CommentVO;

public interface CommentService {

	// 게시글 등록
	void insertComment(CommentVO vo);

	// 게시글 수정
	void updateComment(CommentVO vo);

	void deleteComment(CommentVO vo);

	CommentVO getComment(CommentVO vo);

	List<CommentVO> getCommentList(CommentVO vo);

}