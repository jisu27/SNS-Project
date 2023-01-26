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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.ezen.dto.CommentVO;
import com.ezen.dto.MemberVO;
import com.ezen.service.CommentService;

@Controller
public class CommentController {

	@Autowired 
	private CommentService commentService;
	
	@RequestMapping(value = "/insertComment.do")
	public String insertReview(CommentVO vo,HttpSession session,Model model) throws IllegalStateException, IOException {
		
		String id=(String) session.getAttribute("id");
		vo.setId(id);
		
		if(session.getAttribute("id") == null) {
			return "index";
		} else {
			System.out.println("´ñ±ÛÀ¯Àú: " + session.getAttribute("id"));
				
		commentService.insertComment(vo);
		session.setAttribute("bSeq", vo.getBseq());
		return "getBoard.do?id=0";
		}
	
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
	public String deleteReview(CommentVO vo,HttpSession session,@RequestParam("cseq")int cseq,@RequestParam("Bseq")int bseq) throws IllegalStateException, IOException {
		
		vo.setCseq(cseq);
		vo.setBseq(bseq);
		
		commentService.deleteComment(vo);
		
		session.setAttribute("movie_seq",vo.getBseq());
		
		return "getBoardList?id=0";
	}
	@RequestMapping(value = "/getComment.do")
	public String getReviewList(CommentVO vo, Model model ) {

		List<CommentVO> commentList = commentService.getCommentList(vo);
		System.out.println(commentList);
		model.addAttribute("commentList", commentList);
        model.addAttribute("id",vo.getBseq());
		
		return "getBoard.do";
	}
	
}
