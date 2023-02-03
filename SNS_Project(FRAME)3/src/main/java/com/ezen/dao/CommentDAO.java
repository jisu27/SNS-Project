package com.ezen.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.CommentVO;

@Repository("commentDAO")
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 게시글 등록
	public void insertComment(CommentVO vo) {
		System.out.println("===> Mybatis로 insertComment() 기능 처리");
		mybatis.insert("commentMapper.insertComment", vo);
		
	}
	
	// 게시글 수정
	public void updateComment(CommentVO vo) {
		System.out.println("===> Mybatis로 updateComment() 기능 처리");
		mybatis.update("commentMapper.updateComment", vo);
	
	}
	
	// 게시글 삭제
	
	public void deleteComment(CommentVO vo) {
		System.out.println("===> Mybatis로 deleteComment() 기능 처리");
		mybatis.delete("commentMapper.deleteComment", vo);
	}
	
	public CommentVO getComment(CommentVO vo) {
		System.out.println("===> Mybatis로 getComment() 기능 처리");
		return mybatis.selectOne("commentMapper.getComment", vo);
	}
	
	public List<CommentVO> getCommentList(CommentVO vo){
		System.out.println("===> Mybatis로 getCommentList() 기능 처리");
		return mybatis.selectList("commentMapper.getCommentList", vo);
	}
	
}
