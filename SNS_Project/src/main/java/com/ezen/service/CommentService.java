package com.ezen.service;

import java.util.List;

import com.ezen.dto.CommentVO;

public interface CommentService {

	// �Խñ� ���
	void insertComment(CommentVO vo);

	// �Խñ� ����
	void updateComment(CommentVO vo);

	void deleteComment(CommentVO vo);

	CommentVO getComment(CommentVO vo);

	List<CommentVO> getCommentList(CommentVO vo);

}