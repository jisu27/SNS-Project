package com.ezen.service;

import java.util.List;

import com.ezen.dto.BoardVO;

public interface BoardService {

	List<BoardVO> BoardList(BoardVO vo);
	
	List<BoardVO> myBoardList(BoardVO vo);
	
	void InsertBoard(BoardVO vo);
	
	public BoardVO getBoard(BoardVO vo);
	
	void updateBoard(BoardVO vo);
}