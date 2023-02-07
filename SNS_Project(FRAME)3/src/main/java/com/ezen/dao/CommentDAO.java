package com.ezen.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.CommentVO;

<<<<<<< HEAD
@Repository("SnsCommentDAO")
public class CommentDAO   {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// °Ô½Ã±Û µî·Ï
	public int saveComment(CommentVO vo) {
		System.out.println("===> Mybatis·Î saveComment() ±â´É Ã³¸®");
		return mybatis.insert("CommentMapper.saveComment", vo);
		
	}
	
	public List<CommentVO> commentList(int cseq){
		
		return mybatis.selectList("CommentMapper.commentList", cseq);
	}
	
	public int countCommentList(int cseq) {
		return mybatis.selectOne("CommentMapper.countcommentList", cseq);
	}
	
	/*
	public List<CommentVO>  commentListWithPaging(Criteria criteria, int cseq){
		HashMap<String,Object> map = new HashMap<>();
		
		map.put("criteria", criteria);
		map.put("cseq", cseq);
		
		return mybatis.selectList("CommentMapper.commentListWithPaging", map);
	}
	*/
=======
@Repository("commentDAO")
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// ï¿½Ô½Ã±ï¿½ ï¿½ï¿½ï¿½
	public void insertComment(CommentVO vo) {
		//System.out.println("===> Mybatisï¿½ï¿½ insertComment() ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½");
		mybatis.insert("commentMapper.insertComment", vo);
		
	}
	
	// ï¿½Ô½Ã±ï¿½ ï¿½ï¿½ï¿½ï¿½
	public void updateComment(CommentVO vo) {
		//System.out.println("===> Mybatisï¿½ï¿½ updateComment() ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½");
		mybatis.update("commentMapper.updateComment", vo);
	
	}
	
	// ï¿½Ô½Ã±ï¿½ ï¿½ï¿½ï¿½ï¿½
	
	public void deleteComment(CommentVO vo) {
		//System.out.println("===> Mybatisï¿½ï¿½ deleteComment() ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½");
		mybatis.delete("commentMapper.deleteComment", vo);
	}
	
	public CommentVO getComment(CommentVO vo) {
		//System.out.println("===> Mybatisï¿½ï¿½ getComment() ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½");
		return mybatis.selectOne("commentMapper.getComment", vo);
	}
	
	public List<CommentVO> getCommentList(CommentVO vo){
		//System.out.println("===> Mybatisï¿½ï¿½ getCommentList() ï¿½ï¿½ï¿½ Ã³ï¿½ï¿½");
		return mybatis.selectList("commentMapper.getCommentList", vo);
	}
	
>>>>>>> refs/remotes/origin/ê²½ì„ë‹˜
}
