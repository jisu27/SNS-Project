package com.ezen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.dao.BookMarkDAO;
import com.ezen.dto.BookMarkVO;

@Service("BookMarkService")
public class BookMarkServiceImpl implements BookMarkService {
	BookMarkDAO bmDAO;
	
	@Override
	public void insertBookMark(BookMarkVO vo) {
		bmDAO.insertBookMark(vo);

	}

	@Override
	public void updateBookMark(BookMarkVO vo) {
		bmDAO.updateBookMark(vo);
	}

	@Override
	public void deleteBookMark(BookMarkVO vo) {
		bmDAO.deleteBookMark(vo);

	}
	
	@Override
	public void deleteShortsBookMark(BookMarkVO vo) {
		bmDAO.deleteShortsBookMark(vo);
	}
	
	@Override
	public void deleteBoardBookMark(BookMarkVO vo) {
		bmDAO.deleteBoardBookMark(vo);
	}

	@Override
	public List<BookMarkVO> getBoardBookMarkList(BookMarkVO vo) {

		return bmDAO.getBoardBookMarkList(vo);
	}

	@Override
	public List<BookMarkVO> getShortsBookMarkList(BookMarkVO vo) {

		return bmDAO.getShortsBookMarkList(vo);
	}

	@Override
	public List<BookMarkVO> getBookMarkList(BookMarkVO vo) {

		return bmDAO.getBookMarkList(vo);
	}

	@Override
	public BookMarkVO getBookMark(BookMarkVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
