package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.ShortsCommentVO;

@Repository
public class ShortsCommentDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insertComment(ShortsCommentVO vo) {
		mybatis.insert("ShortsCommentMapper.insertComment", vo);
	}
	
	
	public void updateComment(ShortsCommentVO vo) {
		mybatis.update("ShortsCommentMapper.updateComment", vo);
	}


	public void deleteComment(ShortsCommentVO vo) {
		mybatis.delete("ShortsCommentMapper.deleteComment", vo);
	}
	

	public List<ShortsCommentVO> getCommentList(ShortsCommentVO vo){
		return mybatis.selectList("ShortsCommentMapper.getCommentList", vo);
	}
	
	public ShortsCommentVO getComment(ShortsCommentVO vo) {
		return mybatis.selectOne("ShortsCommentMapper.getComment", vo);
	}

	public int getCountCommentList(int s_seq) {
		return mybatis.selectOne("ShortsCommentMapper.getCountCommentList", s_seq);
	}
	
	
}










