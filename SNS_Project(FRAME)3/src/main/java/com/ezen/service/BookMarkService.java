package com.ezen.service;

import java.util.List;

import com.ezen.dto.BookMarkVO;

public interface BookMarkService {
	void insertBookMark(BookMarkVO vo);

	void updateBookMark(BookMarkVO vo);

	void deleteBookMark(BookMarkVO vo);

	List<BookMarkVO> getBoardBookMarkList(BookMarkVO vo);

	List<BookMarkVO> getShortsBookMarkList(BookMarkVO vo);

	List<BookMarkVO> getAllBookMarkList(BookMarkVO vo);

	BookMarkVO getBookMark(BookMarkVO vo);
}
