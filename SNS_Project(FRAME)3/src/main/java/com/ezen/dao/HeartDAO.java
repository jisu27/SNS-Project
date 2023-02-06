package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.BoardVO;
import com.ezen.dto.HeartVO;

@Repository
public class HeartDAO  {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HeartVO like(HeartVO vo) {
		
		return mybatis.selectOne("heartMapper.like",vo);
	}
	public HeartVO Insertlike(HeartVO vo) {
		
		return mybatis.selectOne("heartMapper.insertLike",vo);
	}
	public List<HeartVO> boardLike(HeartVO vo) {
		
		return mybatis.selectList("heartMapper.likeBoard",vo);
	}
	public void deleteLike(HeartVO vo) {
		mybatis.selectOne("heartMapper.deleteLike",vo);
	}
	
	public int getLikeCount(HeartVO vo) {
		return mybatis.selectOne("heartMapper.likeCount",vo);
	}
}