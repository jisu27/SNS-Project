package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.CommentDAO;
import com.ezen.dto.CommentVO;

@Service
public class CommentServiceImpl implements CommentSerivce {

	@Autowired
	private CommentDAO cDao;
	@Override
	public int saveComment(CommentVO vo) {
		
		return cDao.saveComment(vo);
	}

	@Override
	public List<CommentVO> getcommentList(int cseq) {
		
		return cDao.commentList(cseq);
	}

	@Override
	public int getcountCommentList(int cseq) {
		
		return cDao.countCommentList(cseq);
	}

}
