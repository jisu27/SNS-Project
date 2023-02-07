package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.HeartDAO;
import com.ezen.dto.HeartVO;
@Service
public class HeartServiceImpl implements HeartService {

	@Autowired
	private HeartDAO hDao; 
	
	@Override
	public HeartVO like(HeartVO vo) {
		
		return hDao.like(vo);
	}

	@Override
	public void insertLike(HeartVO vo) {
<<<<<<< HEAD
=======
		
>>>>>>> refs/remotes/origin/경석님
		hDao.Insertlike(vo);
		
	}

	@Override
	public List<HeartVO> boardLike(HeartVO vo) {
		
		return hDao.boardLike(vo);
	}

	@Override
	public void deleteLike(HeartVO vo) {
		hDao.deleteLike(vo);
		
	}

	@Override
	public int likeCount(HeartVO vo) {
	
		return hDao.getLikeCount(vo);
	}

}
