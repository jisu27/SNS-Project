package com.ezen.service;

import java.util.List;

import com.ezen.dto.BoardVO;

public interface BoardService {

	List<BoardVO> BoardList(BoardVO vo);

	BoardVO myBoard(BoardVO vo);
	
	List<BoardVO> myBoardList(BoardVO vo);
	
	void InsertBoard(BoardVO vo);
}