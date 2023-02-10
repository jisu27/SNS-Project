package com.ezen.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.dto.AdminVO;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminVO> viewAd () {
		return mybatis.selectList("adminMapper.viewAd");
	}
	public List<AdminVO> viewAd2 () {
		return mybatis.selectList("adminMapper.viewAd2");
	}
	public void updateAdmin(int aSeq) {
		mybatis.update("adminMapper.updateAdmin",aSeq);
	}
	public void insertAd(AdminVO vo) {
		mybatis.insert("adminMapper.insertAd",vo);
	}
}
