package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.BoardDAO;
import com.ezen.dto.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bDao;
	
	@Override
	public List<BoardVO> BoardList(BoardVO vo) {
		
		return bDao.BoardList(vo);
	}

	@Override
	public void InsertBoard(BoardVO vo) {
		bDao.insertBoard(vo);
		
	}

	@Override
	public List<BoardVO> myBoardList(BoardVO vo) {
		return 	bDao.myBoardList(vo);
	}

	@Override
	public BoardVO myBoard(BoardVO vo) {
		
		return bDao.myBoard(vo);
	}
	

}
