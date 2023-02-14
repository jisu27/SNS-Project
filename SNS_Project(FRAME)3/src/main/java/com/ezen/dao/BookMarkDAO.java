package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.BookMarkVO;

@Repository("BookMarkDAO")
public class BookMarkDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBookMark(BookMarkVO vo) {
		mybatis.insert("bookMarkMapper.insertComment", vo);

	}

	public void updateBookMark(BookMarkVO vo) {
		mybatis.update("bookMarkMapper.updateBookMark", vo);

	}

	public void deleteBookMark(BookMarkVO vo) {
		mybatis.delete("bookMarkMapper.deleteBookMark", vo);

	}
	
	public void deleteShortsBookMark(BookMarkVO vo) {
		mybatis.delete("bookMarkMapper.deleteShortsBookMark", vo);
	}
	
	public void deleteBoardBookMark(BookMarkVO vo) {
		mybatis.delete("bookMarkMapper.deleteBoardBookMark", vo);
	}

	public List<BookMarkVO> getBoardBookMarkList(BookMarkVO vo) {

		return mybatis.selectList("bookMarkMapper.getBoardBookMarkList", vo);
	}

	public List<BookMarkVO> getShortsBookMarkList(BookMarkVO vo) {

		return mybatis.selectList("bookMarkMapper.getShortsBookMarkList", vo);
	}

	public List<BookMarkVO> getBookMarkList(BookMarkVO vo) {

		return mybatis.selectList("bookMarkMapper.getBookMarkList", vo);
	}

	public BookMarkVO getBookMark(BookMarkVO vo) {

		return mybatis.selectOne("bookMarkMapper.getBookMark", vo);
	}
}
