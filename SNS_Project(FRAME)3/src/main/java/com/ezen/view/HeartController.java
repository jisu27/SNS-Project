package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.BoardVO;
import com.ezen.dto.CommentVO;
import com.ezen.dto.HeartVO;
import com.ezen.dto.MemberVO;
import com.ezen.service.BoardService;
import com.ezen.service.CommentService;
import com.ezen.service.HeartService;
import com.ezen.service.MemberService;

@Controller
public class HeartController {

	@Autowired
	private HeartService heartService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CommentService commentService;

	@PostMapping("heart.do")
	public String insertLike(HeartVO vo, Model model, HttpSession session) {

		System.out.println("heartvo���엯�쓽 踰덊샇 !! =============" + vo);

		vo.setUse_like("y");
		heartService.insertLike(vo);

		BoardVO board = new BoardVO();
		board.setbSeq(vo.getbSeq());
		board.setCount(heartService.likeCount(vo));
		boardService.updateCount(board);		

		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart", heart);
				
		return "redirect:home.do";
	}
	@PostMapping("heart_c.do")
	public String insertLike_c(HeartVO vo, Model model, HttpSession session) {


		vo.setUse_like("y");
		heartService.insertLike(vo);
	
		CommentVO comment = new CommentVO();
		comment.setCseq(vo.getCseq());
		comment.setCount(heartService.likeCommentCount(vo));
		commentService.updateCount(comment);
		
		List<Integer> c_heart = heartService.commentLike(vo);
		
		session.setAttribute("c_heart", c_heart);

		System.out.println("heartvo���엯�쓽 踰덊샇 !! =============" + vo);

		return "redirect:home.do";
	}

	@PostMapping("getHeart.do")
	public String getInsertLike(MemberVO mvo, HeartVO vo, Model model, HttpSession session) {

		vo.setUse_like("y");
		heartService.insertLike(vo);
		

		BoardVO board = new BoardVO();
		board.setbSeq(vo.getbSeq());
		board.setCount(heartService.likeCount(vo));
		boardService.updateCount(board);	

		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart", heart);
		
		System.out.println("heartvo���엯�쓽 踰덊샇 !! =============" + vo);

		return "redirect:getBoard.do?bSeq=" + vo.getBseq() + "&profile=" + mvo.getProfile();
	}
	@PostMapping("getHeart_c.do")
	public String getInsertLike_c(MemberVO mvo, HeartVO vo, Model model, HttpSession session) {

		vo.setUse_like("y");
		heartService.insertLike(vo);
		
		CommentVO comment = new CommentVO();
		comment.setCseq(vo.getCseq());
		comment.setCount(heartService.likeCommentCount(vo));
		commentService.updateCount(comment);
		
		List<Integer> c_heart = heartService.commentLike(vo);
		
		session.setAttribute("c_heart", c_heart);
		
		System.out.println("heartvo���엯�쓽 踰덊샇 !! =============" + vo);

		return "redirect:getBoard.do?bSeq=" + vo.getBseq() + "&profile=" + mvo.getProfile();
	}
	
	

	@PostMapping("deleteHeart.do")
	public String deleteLike(HeartVO vo, HttpSession session) {

		System.out.println("heartvo���엯�쓽 踰덊샇 !! =============" + vo);
		heartService.deleteLike(vo);

		BoardVO board = new BoardVO();
		board.setbSeq(vo.getbSeq());
		board.setCount(heartService.likeCount(vo));
		boardService.updateCount(board);

		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart", heart);
		

		return "redirect:home.do";
	}
	@PostMapping("deleteHeart_c.do")
	public String deleteLike_c(HeartVO vo, HttpSession session) {

		System.out.println("heartvo���엯�쓽 踰덊샇 !! =============" + vo);
		heartService.deleteLike_c(vo);
		
		CommentVO comment = new CommentVO();
		comment.setCseq(vo.getCseq());
		comment.setCount(heartService.likeCommentCount(vo));
		commentService.updateCount(comment);
		
		List<Integer> c_heart = heartService.commentLike(vo);
		session.setAttribute("c_heart", c_heart);

		return "redirect:home.do";
	}

	@PostMapping("getDeleteHeart.do")
	public String getDeleteLike(MemberVO mvo, HeartVO vo, HttpSession session) {

		heartService.deleteLike(vo);

		BoardVO board = new BoardVO();
		
		board.setbSeq(vo.getbSeq());
		board.setCount(heartService.likeCount(vo));
		
		boardService.updateCount(board);

		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart", heart);

		return "redirect:getBoard.do?bSeq=" + vo.getBseq() + "&profile=" + mvo.getProfile();
	}
	@PostMapping("getDeleteHeart_c.do")
	public String getDeleteLike_c(MemberVO mvo, HeartVO vo, HttpSession session) {

		heartService.deleteLike_c(vo);

		CommentVO comment = new CommentVO();

		comment.setCseq(vo.getCseq());
		comment.setCount(heartService.likeCommentCount(vo));
		
		commentService.updateCount(comment);
		
		List<Integer> c_heart = heartService.commentLike(vo);
		session.setAttribute("c_heart", c_heart);

		return "redirect:getBoard.do?bSeq=" + vo.getBseq() + "&profile=" + mvo.getProfile();
	}

	@GetMapping("getLikeList.do")
	public String goLikeList(HeartVO hvo, HttpSession session, Model model) {

		BoardVO bvo = new BoardVO();
		CommentVO cvo = new CommentVO();

		List<BoardVO> boardList = new ArrayList<>();
		List<HeartVO> heartList = heartService.boardLike(hvo);
		List<MemberVO> memberList = new ArrayList<>();
		List<CommentVO> commentList = new ArrayList<>();

		MemberVO mvo = new MemberVO();

		for (HeartVO vo : heartList) {

			bvo.setbSeq(vo.getbSeq());
			BoardVO board = boardService.myBoard(bvo);
			boardList.add(board);
			
			cvo.setCseq(vo.getCseq());
			CommentVO comment = commentService.getComment(cvo);
			commentList.add(comment);

			mvo.setId(board.getId());
			MemberVO member = memberService.MemberCheck(mvo);
			memberList.add(member);

		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("commentList", commentList);

		return "likeList";

	}

}
