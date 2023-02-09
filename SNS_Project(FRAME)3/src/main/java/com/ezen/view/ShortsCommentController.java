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
import com.ezen.service.ShortsCommentService;

@Controller
public class ShortsCommentController {
	
	@Autowired
	private ShortsCommentService service;
	
	@PostMapping(value="/insertShortsComment")
	public String insertShortsComment(ShortsCommentVO vo, HttpSession session, HttpServletRequest request) {
		
		MemberVO user= (MemberVO) session.getAttribute("user");
		
		if(user == null) {
			return "login";
			
		}else {
			vo.setId(user.getId());
			System.out.println(vo);
			service.insertShortsComment(vo);
			
			return "redirect:" + (String)request.getHeader("Referer");
		}	
	}
	
	@GetMapping(value="/updateShortsComment")
	public String updateShortsCommentView(ShortsCommentVO vo, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		ShortsCommentVO comment = service.getShortsComment(vo);
		
		model.addAttribute("comment", comment);
		return "updateComment";
	}
	
	@PostMapping(value="/updateShortsComment")
	public String updateShortsComment(ShortsCommentVO vo, Model model, HttpSession session)throws IOException {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user == null) {
			return "login";
			
		}else if (user.getId() != vo.getId()) {
			return "getShortsList";
		} else {
			service.updateShortsComment(vo);
			return "getShorts?sSeq="+vo.getsSeq();
		}
	}
	
	@RequestMapping(value="/deleteShortsComment")
	public String deleteShortsComment(ShortsCommentVO vo, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(!session.getAttribute("id").equals(vo.getId())) {
			return "login";
		}else {		
			service.deleteShortsComment(vo);
			return "redirect:getShorts";
		}
	}
	
	/*@RequestMapping(value="/getShortsCommetList", produces="application/json; charset=UTF-8")
	public Map<String, Object> getShortsCommentList(ShortsCommentVO vo){
		
		Map<String, Object> comment = new HashMap<>();
		
		List<ShortsCommentVO> list = service.getShortsCommentList(vo);
		
		comment.put("total", list.size());
		comment.put("commentList", list);
		
		return comment;
		
	}*/
	
	@RequestMapping(value = "/getShortsCommentList")
	public String getCommentList(ShortsCommentVO vo, Model model) {

		List<ShortsCommentVO> ShortsCommentList = service.getShortsCommentList(vo);
		System.out.println(ShortsCommentList);
		model.addAttribute("ShortsCommentList", ShortsCommentList);

		return "redirect:getShorts";
	}

}
