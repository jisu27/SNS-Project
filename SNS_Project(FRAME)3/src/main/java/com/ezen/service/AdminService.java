package com.ezen.service;

import java.util.List;

import com.ezen.dto.AdminVO;

public interface AdminService {

	List<AdminVO> viewAd();
	
	List<AdminVO> viewAd2();
	
	 void updateAdmin(int aSeq);
	 
	 void insertAd(AdminVO vo);
}