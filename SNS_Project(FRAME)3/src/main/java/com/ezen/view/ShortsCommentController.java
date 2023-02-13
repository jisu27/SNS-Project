package com.ezen.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dto.CommentVO;
import com.ezen.dto.MemberVO;
import com.ezen.dto.ShortsCommentVO;
import com.ezen.dto.ShortsVO;
import com.ezen.service.HeartService;
import com.ezen.service.MemberService;
import com.ezen.service.ShortsCommentService;
import com.ezen.service.ShortsService;

@Controller
public class ShortsCommentController {

	@Autowired
	private ShortsService shos;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	@Autowired
	private ShortsCommentService service;

	@PostMapping(value = "/insertShortsComment")
	public String insertShortsComment(ShortsCommentVO vo, HttpSession session, HttpServletRequest request) {

		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {
			return "login";

		} else {
			vo.setId(user.getId());
			System.out.println(vo);
			service.insertShortsComment(vo);

			return "redirect:" + (String) request.getHeader("Referer");
		}
	}

	@GetMapping(value = "/updateShortsComment")
	public String updateShortsCommentview(ShortsCommentVO vo, Model model, HttpSession session) {

		ShortsCommentVO shortsComment = service.getShortsComment(vo);

		model.addAttribute("shortsComment", shortsComment);
		return "updateShortsComment";
	}

	@PostMapping(value = "/updateShortsComment.do")
	public String updateShortsComment(ShortsCommentVO vo, Model model, HttpSession session) throws IOException {

		service.updateShortsComment(vo);

		return "redirect:getShorts?sSeq=" + Integer.toString(vo.getsSeq());
	}

	@RequestMapping(value = "/deleteShortsComment")
	public String deleteShortsComment(ShortsCommentVO vo, HttpSession session, HttpServletRequest request) {
		service.deleteShortsComment(vo);
		System.out.println(vo);
		return "redirect:" + (String) request.getHeader("Referer");

	}

	/*
	 * @RequestMapping(value="/getShortsCommetList",
	 * produces="application/json; charset=UTF-8") public Map<String, Object>
	 * getShortsCommentList(ShortsCommentVO vo){
	 * 
	 * Map<String, Object> comment = new HashMap<>();
	 * 
	 * List<ShortsCommentVO> list = service.getShortsCommentList(vo);
	 * 
	 * comment.put("total", list.size()); comment.put("commentList", list);
	 * 
	 * return comment;
	 * 
	 * }
	 */

	@RequestMapping(value = "/getShortsCommentList")
	public String getCommentList(ShortsCommentVO vo, Model model) {

		List<ShortsCommentVO> ShortsCommentList = service.getShortsCommentList(vo);
		System.out.println(ShortsCommentList);
		model.addAttribute("ShortsCommentList", ShortsCommentList);

		return "redirect:getShorts";
	}

}
