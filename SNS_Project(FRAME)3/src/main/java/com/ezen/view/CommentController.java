package com.ezen.view;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.dto.CommentVO;
import com.ezen.service.CommentService;

@Controller
@SessionAttributes("comment")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@PostMapping(value = "/insertComment.do")
	public String saveCommentAction(CommentVO cvo, HttpSession session, HttpServletRequest request) {

		commentService.insertComment(cvo);

		// ���� �������� ����������.
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/updateComment.do")
	public String updateReview(CommentVO vo, HttpSession session) throws IllegalStateException, IOException {

		if (session.getAttribute("id") == null) {
			return "index";
		} else {
			commentService.updateComment(vo);
		}

		return "redirect:getBoard";
	}

	@RequestMapping(value = "/deleteComment.do")
	public String deleteReview(CommentVO vo, HttpServletRequest request) throws IllegalStateException, IOException {

		commentService.deleteComment(vo);

		// ���� �������� ����������.
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;

	}

	@RequestMapping(value = "/getCommentList.do")
	public String getCommentList(CommentVO vo, Model model) {

		List<CommentVO> commentList = commentService.getCommentList(vo);
		System.out.println(commentList);
		model.addAttribute("commentList", commentList);
		// model.addAttribute("id",vo.getBseq());

		return "redirect:getBoard.do";
	}

}
