package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.HeartVO;
import com.ezen.service.HeartService;

@Controller
public class HeartController {

	
	@Autowired
	private HeartService heartService;
	
	@PostMapping("heart.do")
	public String insertLike(HeartVO vo,Model model,HttpSession session){
		
		System.out.println("heartvo타입의 번호 !! ============="+vo);
		
		vo.setUse_like("y");
		heartService.insertLike(vo);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:home.do";
	}
	
	@PostMapping("getHeart.do")
	public String getInsertLike(HeartVO vo,Model model,HttpSession session){
		
		System.out.println("heartvo타입의 번호 !! ============="+vo);
		vo.setUse_like("y");
		heartService.insertLike(vo);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:getBoard.do?bSeq="+vo.getBseq();
	}
	
	@PostMapping("deleteHeart.do")
	public String deleteLike(HeartVO vo,HttpSession session) {
		
		System.out.println("heartvo타입의 번호 !! ============="+vo);
		heartService.deleteLike(vo);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:home.do";
	}
	
	@PostMapping("getDeleteHeart.do")
	public String getDeleteLike(HeartVO vo,HttpSession session) {
		
		heartService.deleteLike(vo);
=======
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.BoardVO;
import com.ezen.dto.HeartVO;
import com.ezen.service.BoardService;
import com.ezen.service.HeartService;

@Controller
public class HeartController {

	
	@Autowired
	private HeartService heartService;
	@Autowired
	private BoardService boardService;
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
>>>>>>> refs/remotes/origin/경석님
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:getBoard.do?bSeq="+vo.getBseq();
	}
}
