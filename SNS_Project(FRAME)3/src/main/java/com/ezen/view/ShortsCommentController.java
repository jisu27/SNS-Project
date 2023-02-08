package com.ezen.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dto.MemberVO;
import com.ezen.dto.ShortsCommentVO;
import com.ezen.service.ShortsCommentService;

@Controller
public class ShortsCommentController {
	
	@Autowired
	private ShortsCommentService service;
	
	@PostMapping(value="/insertComment")
	public String insertComment(ShortsCommentVO vo, HttpSession session) {
		
		MemberVO user= (MemberVO) session.getAttribute("user");
		
		if(user == null) {
			return "login";
			
		}else {
			vo.setId(user.getId());

			service.insertComment(vo);
			
			return "success";
		}	
	}
	
	@GetMapping(value="/updateComment")
	public String updateCommentView(ShortsCommentVO vo, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		ShortsCommentVO comment = service.getComment(vo);
		
		model.addAttribute("comment", comment);
		return "updateComment";
	}
	
	@PostMapping(value="/updateComment")
	public String updateComment(ShortsCommentVO vo, Model model, HttpSession session)throws IOException {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user == null) {
			return "login";
			
		}else if (user.getId() != vo.getId()) {
			return "getShortsList";
		} else {
			service.updateComment(vo);
			return "getShorts?sSeq="+vo.getsSeq();
		}
	}
	
	@RequestMapping(value="/deleteComment")
	public String deleteComment(ShortsCommentVO vo, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(!session.getAttribute("id").equals(vo.getId())) {
			return "login";
		}else {		
			service.deleteComment(vo);
			return "redirect:getShorts";
		}
	}
	
	@RequestMapping(value="/getCommetList", produces="application/json; charset=UTF-8")
	public Map<String, Object> getCommentList(ShortsCommentVO vo){
		
		Map<String, Object> comment = new HashMap<>();
		
		List<ShortsCommentVO> list = service.getCommentList(vo);
		
		comment.put("total", list.size());
		comment.put("commentList", list);
		
		return comment;
		
	}

}
