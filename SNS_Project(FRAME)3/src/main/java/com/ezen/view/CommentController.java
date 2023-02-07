package com.ezen.view;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.CommentVO;
import com.ezen.dto.MemberVO;

@Controller
public class CommentController {

	@Autowired 
	private com.ezen.service.CommentSerivce commentService;
	
	@PostMapping(value="/save")
	public String saveCommentAction(CommentVO commentVO, HttpSession session) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "not_logedin";
			
		}else {
			commentVO.setId(loginUser.getId()); // ªÁøÎ¿⁄ id ¿˙¿Â
			
			// ªÛ«∞∆Ú ¿˙¿Â
			if (commentService.saveComment(commentVO) > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	@GetMapping(value = "/list" , produces="application/json; charset=UTF-8")
	public Map<String, Object> commentList(CommentVO vo){
		Map<String	, Object> commentInfo = new HashMap<>();
		
		// ªÛ«∞ ¥Ò±€ ∏Ò∑œ ¡∂»∏
			List<CommentVO> commentList = commentService.getcommentList(vo.getCseq());
			
			commentInfo.put("total", commentList.size());
			commentInfo.put("commentList", commentList);
			
			return commentInfo;
=======
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.dto.CommentVO;
import com.ezen.dto.MemberVO;
import com.ezen.service.CommentService;

@Controller
@SessionAttributes("comment")
public class CommentController {

	@Autowired 
	private CommentService commentService;
	
	@PostMapping(value="/insertComment.do")
	public String saveCommentAction(CommentVO cvo, HttpSession session, HttpServletRequest request) {
		
		commentService.insertComment(cvo);
		
		
		// ¿Ã¿¸ ∆‰¿Ã¡ˆ∑Œ µπ∑¡∫∏≥ª±‚.
	    String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
		
	}
	
	

	
	@RequestMapping(value = "/updateComment.do")
	public String updateReview(CommentVO vo,HttpSession session) throws IllegalStateException, IOException {

		if(session.getAttribute("id") == null) {
			return "index";
		} else {
			commentService.updateComment(vo);
		}

		return "redirect:getBoard";
	}
	
	@RequestMapping(value = "/deleteComment.do")
	public String deleteReview(CommentVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		
		
		
		commentService.deleteComment(vo);
		
			// ¿Ã¿¸ ∆‰¿Ã¡ˆ∑Œ µπ∑¡∫∏≥ª±‚.
		    String referer = request.getHeader("Referer");
		    return "redirect:"+ referer;
		
		
		
		
	}
	@RequestMapping(value = "/getCommentList.do")
	public String getCommentList(CommentVO vo, Model model ) {

		List<CommentVO> commentList = commentService.getCommentList(vo);
		System.out.println(commentList);
		model.addAttribute("commentList", commentList);
       // model.addAttribute("id",vo.getBseq());
       
		
		return "redirect:getBoard.do";
>>>>>>> refs/remotes/origin/Í≤ΩÏÑùÎãò
	}
	
}
