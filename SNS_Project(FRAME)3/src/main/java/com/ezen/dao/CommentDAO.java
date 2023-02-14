package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.CommentVO;

@Repository("commentDAO")
public class CommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertComment(CommentVO vo) {
		mybatis.insert("commentMapper.insertComment", vo);

	}

	// 
	public void updateComment(CommentVO vo) {
		mybatis.update("commentMapper.updateComment", vo);

	}

	// 
	public void deleteComment(CommentVO vo) {
		mybatis.delete("commentMapper.deleteComment", vo);
	}

	public CommentVO getComment(CommentVO vo) {
		return mybatis.selectOne("commentMapper.getComment", vo);
	}

	public List<CommentVO> getCommentList(CommentVO vo) {
		return mybatis.selectList("commentMapper.getCommentList", vo);
	}
	
	public void updateCount(CommentVO vo) {
		mybatis.update("commentMapper.updateCount", vo);
	}


}
