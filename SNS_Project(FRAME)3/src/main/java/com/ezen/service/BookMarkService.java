package com.ezen.service;

import java.util.List;

import com.ezen.dto.BookMarkVO;

public interface BookMarkService {
	void insertBookMark(BookMarkVO vo);

	void updateBookMark(BookMarkVO vo);

	void deleteBookMark(BookMarkVO vo);

	BookMarkVO getBoardBookMark(BookMarkVO vo);

	BookMarkVO getShortsBookMark(BookMarkVO vo);

	BookMarkVO getAllBookMark(BookMarkVO vo);

	List<BookMarkVO> getBookMarkList(BookMarkVO vo);
}
