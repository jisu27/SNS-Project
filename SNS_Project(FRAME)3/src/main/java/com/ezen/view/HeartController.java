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
import com.ezen.dto.HeartVO;
import com.ezen.dto.MemberVO;
import com.ezen.service.BoardService;
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
	
	@PostMapping("heart.do")
	public String insertLike(HeartVO vo,Model model,HttpSession session){
		
		System.out.println("heartvo타입의 번호 !! ============="+vo);
		
		vo.setUse_like("y");
		heartService.insertLike(vo);
		
		BoardVO board = new BoardVO();
	      board.setbSeq(vo.getbSeq());
	      board.setCount(heartService.likeCount(vo));
	      boardService.updateCount(board);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:home.do";
	}
	
	@PostMapping("getHeart.do")
	public String getInsertLike(HeartVO vo,Model model,HttpSession session){
		
		System.out.println("heartvo타입의 번호 !! ============="+vo);
		vo.setUse_like("y");
		heartService.insertLike(vo);
		
		BoardVO board = new BoardVO();
	      board.setbSeq(vo.getbSeq());
	      board.setCount(heartService.likeCount(vo));
	      boardService.updateCount(board);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:getBoard.do?bSeq="+vo.getBseq();
	}
	
	@PostMapping("deleteHeart.do")
	public String deleteLike(HeartVO vo,HttpSession session) {
		
		System.out.println("heartvo타입의 번호 !! ============="+vo);
		heartService.deleteLike(vo);
		
		BoardVO board = new BoardVO();
	      board.setbSeq(vo.getbSeq());
	      board.setCount(heartService.likeCount(vo));
	      boardService.updateCount(board);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:home.do";
	}
	
	@PostMapping("getDeleteHeart.do")
	public String getDeleteLike(HeartVO vo,HttpSession session) {
		
		heartService.deleteLike(vo);
		
		BoardVO board = new BoardVO();
	      board.setbSeq(vo.getbSeq());
	      board.setCount(heartService.likeCount(vo));
	      boardService.updateCount(board);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:getBoard.do?bSeq="+vo.getBseq();
	}
	
	@GetMapping("getLikeList.do")
	public String goLikeList(HeartVO hvo, HttpSession session,Model model) {
		
		BoardVO bvo = new BoardVO();
		
		List<BoardVO> boardList =new ArrayList<>();
		List<HeartVO> heartList = heartService.boardLike(hvo);
		List<MemberVO> memberList = new ArrayList<>();
		
		MemberVO mvo =new MemberVO();
		
		for(HeartVO vo : heartList) {
			
			bvo.setbSeq(vo.getbSeq());
			BoardVO board = boardService.myBoard(bvo);
			boardList.add(board);	
			
			mvo.setId(board.getId());
			MemberVO member = memberService.MemberCheck(mvo);
			memberList.add(member);
		
		}
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);
		
		return "likeList";
		
	}
}
