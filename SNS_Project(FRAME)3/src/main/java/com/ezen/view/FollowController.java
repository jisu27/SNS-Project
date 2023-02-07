package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.FollowVO;
import com.ezen.dto.MemberVO;
import com.ezen.service.FollowService;
import com.ezen.service.MemberService;

@Controller
public class FollowController {

	@Autowired
	private FollowService followService;

	@Autowired
	private MemberService memberService;

	@PostMapping("follow.do")

	public String follow(FollowVO vo, HttpSession session) {

		followService.insertFollow(vo);

		List<FollowVO> list = followService.getFollowList(vo);
		session.setAttribute("follower", list);

		return "redirect:profile.do?id=" + vo.getId2();
	}

	@GetMapping("followList.do")
	public String goFolloweList(FollowVO vo, Model model) {
		List<FollowVO> flist = new ArrayList<>();
		List<MemberVO> mlist = new ArrayList<>();

		if (vo.getId2() != null) {
			flist = followService.getFollowListId1(vo);

			for (FollowVO fo : flist) {
				MemberVO member = new MemberVO();
				member.setId(fo.getId1());

				MemberVO mvo = memberService.MemberCheck(member);

				mlist.add(mvo);
			}

		} else if (vo.getId1() != null) {
			flist = followService.getFollowList(vo);

			for (FollowVO fo : flist) {
				MemberVO member = new MemberVO();
				member.setId(fo.getId2());

				MemberVO mvo = memberService.MemberCheck(member);

				mlist.add(mvo);
			}
		}

		model.addAttribute("memberList", mlist);

		return "followList";
	}

	@PostMapping("deleteFollow.do")
	public String deleteFollow(FollowVO vo, HttpSession session) {

		followService.deleteFollow(vo);

		List<FollowVO> list = followService.getFollowList(vo);
		session.setAttribute("follower", list);

		return "redirect:profile.do?id=" + vo.getId2();
	}

}
