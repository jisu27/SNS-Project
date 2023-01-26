package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ezen.dto.BoardVO;
import com.ezen.dto.FollowVO;
import com.ezen.dto.MemberVO;
import com.ezen.service.BoardService;
import com.ezen.service.FollowService;
import com.ezen.service.MemberService;

@Controller
public class profileController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private FollowService followService;
	
	@GetMapping("profile.do")
	public String goProfile(MemberVO mvo,BoardVO bvo,Model model) {
		
		MemberVO member = memberService.MemberCheck(mvo);
		List<BoardVO> list= boardService.myBoardList(bvo);
		
		FollowVO follow = new FollowVO();
		follow.setId1(mvo.getId().toString());
		follow.setId2(mvo.getId().toString());
		System.out.println(follow);
		
		int follower = followService.getCountFollow(follow);
		int following = followService.getCountFollowing(follow);
		
		
		model.addAttribute("boardList",list);
		model.addAttribute("member",member);
		model.addAttribute("follower",follower);
		model.addAttribute("following",following);
		
		return "myPage";
	}
}
