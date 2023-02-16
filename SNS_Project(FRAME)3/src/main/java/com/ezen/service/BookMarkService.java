package com.ezen.service;

import java.util.List;

import com.ezen.dto.BookMarkVO;

public interface BookMarkService {
	void insertBookMark(BookMarkVO vo);

	void updateBookMark(BookMarkVO vo);

	void deleteBookMark(BookMarkVO vo);
	
	void deleteShortsBookMark(BookMarkVO vo);
	
	void deleteBoardBookMark(BookMarkVO vo);

	List<BookMarkVO> getBoardBookMarkList(BookMarkVO vo);

	List<BookMarkVO> getShortsBookMarkList(BookMarkVO vo);

	List<BookMarkVO> getBookMarkList(BookMarkVO vo);

	BookMarkVO getBookMark(BookMarkVO vo);
	
	List<Integer> getBoardBookMarkNums(BookMarkVO vo);
	
	List<Integer> getShortsBookMarkNums(BookMarkVO vo);
}
