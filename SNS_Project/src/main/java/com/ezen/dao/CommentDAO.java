package com.ezen.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.CommentVO;

@Repository("SnsCommentDAO")
public class CommentDAO   {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 게시글 등록
	public int saveComment(CommentVO vo) {
		System.out.println("===> Mybatis로 saveComment() 기능 처리");
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
}
