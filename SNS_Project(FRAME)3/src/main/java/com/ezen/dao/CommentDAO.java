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

	// 占쌉시깍옙 占쏙옙占�
	public void insertComment(CommentVO vo) {
		// System.out.println("===> Mybatis占쏙옙 insertComment() 占쏙옙占� 처占쏙옙");
		mybatis.insert("commentMapper.insertComment", vo);

	}

	// 占쌉시깍옙 占쏙옙占쏙옙
	public void updateComment(CommentVO vo) {
		// System.out.println("===> Mybatis占쏙옙 updateComment() 占쏙옙占� 처占쏙옙");
		mybatis.update("commentMapper.updateComment", vo);

	}

	// 占쌉시깍옙 占쏙옙占쏙옙

	public void deleteComment(CommentVO vo) {
		// System.out.println("===> Mybatis占쏙옙 deleteComment() 占쏙옙占� 처占쏙옙");
		mybatis.delete("commentMapper.deleteComment", vo);
	}

	public CommentVO getComment(CommentVO vo) {
		// System.out.println("===> Mybatis占쏙옙 getComment() 占쏙옙占� 처占쏙옙");
		return mybatis.selectOne("commentMapper.getComment", vo);
	}

	public List<CommentVO> getCommentList(CommentVO vo) {
		// System.out.println("===> Mybatis占쏙옙 getCommentList() 占쏙옙占� 처占쏙옙");
		return mybatis.selectList("commentMapper.getCommentList", vo);
	}

}
