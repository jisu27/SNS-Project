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
	
	// �Խñ� ���
	public void insertComment(CommentVO vo) {
		//System.out.println("===> Mybatis�� insertComment() ��� ó��");
		mybatis.insert("commentMapper.insertComment", vo);
		
	}
	
	// �Խñ� ����
	public void updateComment(CommentVO vo) {
		//System.out.println("===> Mybatis�� updateComment() ��� ó��");
		mybatis.update("commentMapper.updateComment", vo);
	
	}
	
	// �Խñ� ����
	
	public void deleteComment(CommentVO vo) {
		//System.out.println("===> Mybatis�� deleteComment() ��� ó��");
		mybatis.delete("commentMapper.deleteComment", vo);
	}
	
	public CommentVO getComment(CommentVO vo) {
		//System.out.println("===> Mybatis�� getComment() ��� ó��");
		return mybatis.selectOne("commentMapper.getComment", vo);
	}
	
	public List<CommentVO> getCommentList(CommentVO vo){
		//System.out.println("===> Mybatis�� getCommentList() ��� ó��");
		return mybatis.selectList("commentMapper.getCommentList", vo);
	}
	
}
