package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.CommentDAO;
import com.ezen.dto.CommentVO;

<<<<<<< HEAD
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
=======
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDAO cDao;
	
	
	@Override
	public void insertComment(CommentVO vo) {
		cDao.insertComment(vo);

	}

	@Override
	public void updateComment(CommentVO vo) {
		cDao.updateComment(vo);

	}

	@Override
	public void deleteComment(CommentVO vo) {
		cDao.deleteComment(vo);

	}

	@Override
	public CommentVO getComment(CommentVO vo) {
		
		return cDao.getComment(vo);
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO vo) {
		
		return cDao.getCommentList(vo);
>>>>>>> refs/remotes/origin/경석님
	}

}
