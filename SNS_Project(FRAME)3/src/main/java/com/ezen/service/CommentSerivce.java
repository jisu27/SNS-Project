package com.ezen.service;

import java.util.List;

import com.ezen.dto.CommentVO;

public interface CommentSerivce {

	// �Խñ� ���
	void saveComment(CommentVO vo);

	List<CommentVO> getcommentList(int cseq);

	int getcountCommentList(int cseq);

}