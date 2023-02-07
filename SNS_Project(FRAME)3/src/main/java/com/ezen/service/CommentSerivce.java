package com.ezen.service;

import java.util.List;

import com.ezen.dto.CommentVO;

public interface CommentSerivce {

<<<<<<< HEAD
	// °Ô½Ã±Û µî·Ï
	int saveComment(CommentVO vo);
=======
	// ï¿½Ô½Ã±ï¿½ ï¿½ï¿½ï¿½
	void saveComment(CommentVO vo);
>>>>>>> refs/remotes/origin/ê²½ì„ë‹˜

	List<CommentVO> getcommentList(int cseq);

	int getcountCommentList(int cseq);

}