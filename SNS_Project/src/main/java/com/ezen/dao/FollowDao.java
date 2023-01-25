package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.FollowVO;

@Repository
public class FollowDao {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertFollow(FollowVO vo) {
		mybatis.insert("followMapper.insertFollow", vo);
	}

	public void deleteFollow(FollowVO vo) {
		mybatis.insert("followMapper.deleteFollow", vo);
	}

	public FollowVO getFollow(FollowVO vo) {
		return mybatis.selectOne("followMapper.getFollow", vo);
	}

	public List<FollowVO> getFollowList(FollowVO vo) {
		return mybatis.selectList("followMapper.insertFollow", vo);
	}
	
}
