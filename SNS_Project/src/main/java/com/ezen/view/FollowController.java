package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.FollowVO;
import com.ezen.service.FollowService;

@Controller
public class FollowController {

	@Autowired 
	private FollowService followService;
	
	@PostMapping("follow.do")
	public String follow(FollowVO vo){
		
		followService.insertFollow(vo);
		
		return "myPage";
	}
	
}
