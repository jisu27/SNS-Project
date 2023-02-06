package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.BoardVO;
import com.ezen.dto.JoinBoardVO;

@Repository
public class BoardDAO  {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public List<BoardVO> BoardList(BoardVO vo) {
		return mybatis.selectList("boardMapper.boardList", vo);
	}
	public BoardVO myBoard(BoardVO vo) {
		return mybatis.selectOne("boardMapper.myBoard", vo.getbSeq());
	}
	public List<BoardVO> myBoardList(BoardVO vo) {
		return mybatis.selectList("boardMapper.myBoardList", vo.getId());
	}
	public void insertBoard(BoardVO vo) {
			 mybatis.selectList("boardMapper.insertBoard", vo);
	}
	public void updateBoard(BoardVO vo) {
			mybatis.update("boardMapper.updateBoard", vo);
	}
}