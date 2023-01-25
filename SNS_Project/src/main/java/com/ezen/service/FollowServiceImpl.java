package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.FollowDao;
import com.ezen.dto.FollowVO;

@Service("FollowService")
public class FollowServiceImpl implements FollowService {
	@Autowired
	private FollowDao dao;
	
	
	@Override
	public void insertFollow(FollowVO vo) {
		dao.insertFollow(vo);
	}

	@Override
	public void deleteFollow(FollowVO vo) {
		dao.deleteFollow(vo);

	}

	@Override
	public FollowVO getFollow(FollowVO vo) {
		
		return dao.getFollow(vo);
	}

	@Override
	public List<FollowVO> getFollowList(FollowVO vo) {
		
		return dao.getFollowList(vo);
	}

}
