package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.BoardVO;

@Repository
public class BoardDAO  {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<BoardVO> BoardList(BoardVO vo) {
		return mybatis.selectList("boardMapper.boardList", vo);
	}
	public List<BoardVO> myBoardList(BoardVO vo) {
		return mybatis.selectList("boardMapper.myBoardList", vo.getId());
	}
		
		public void insertBoard(BoardVO vo) {
			 mybatis.selectList("boardMapper.insertBoard", vo);
		
	}
}
