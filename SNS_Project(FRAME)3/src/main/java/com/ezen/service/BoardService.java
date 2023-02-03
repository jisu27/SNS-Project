package com.ezen.service;

import java.util.List;

import com.ezen.dto.BoardVO;
import com.ezen.dto.JoinBoardVO;

public interface BoardService {

	List<BoardVO> BoardList(BoardVO vo);

	BoardVO myBoard(BoardVO vo);
	
	List<BoardVO> myBoardList(BoardVO vo);
	
	void InsertBoard(BoardVO vo);
	
	void updateBoard(BoardVO vo);
	
	public List<BoardVO> getBoardList(BoardVO vo);
	
	public List<BoardVO> getAdverList(BoardVO vo);
}