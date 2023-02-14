package com.ezen.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.dto.BoardVO;
import com.ezen.dto.BookMarkVO;
import com.ezen.dto.MemberVO;
import com.ezen.dto.ShortsVO;
import com.ezen.service.BoardService;
import com.ezen.service.BookMarkService;
import com.ezen.service.MemberService;
import com.ezen.service.ShortsService;

@Controller
public class BookMarkController {
	@Autowired
	private BookMarkService bookMarkService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ShortsService shortsService;

	@PostMapping(value = "insertBookMark")
	public String insertBookMark(BookMarkVO vo, Model model, HttpServletRequest request) {
		bookMarkService.insertBookMark(vo);

		return "redirect:" + (String) request.getHeader("Referer");
	}
	
	@PostMapping(value = "deleteShortsBookMark")
	public String deleteShortsBookMark(BookMarkVO vo, Model model, HttpServletRequest request) {
		bookMarkService.deleteShortsBookMark(vo);
		
		return "redirect:" + (String) request.getHeader("Referer");
	}
	
	@PostMapping(value = "deleteBoardBookMark")
	public String deleteBoardBookMark(BookMarkVO vo, Model model, HttpServletRequest request) {
		bookMarkService.deleteBoardBookMark(vo);
		
		return "redirect:" + (String) request.getHeader("Referer");
	}

	@RequestMapping(value = "deleteBookMark")
	public String deleteBookMark(BookMarkVO vo, HttpServletRequest request) {
		bookMarkService.deleteBookMark(vo);

		return "redirect:" + (String) request.getHeader("Referer");
	}

	@GetMapping(value = "updateBookMark")
	public String updateBookMark(BookMarkVO vo, Model model) {
		bookMarkService.updateBookMark(vo);

		return "bookMarkList";
	}

	@GetMapping(value = "getBookMarkList")
	public String getBookMarkList(BookMarkVO bookMark, BoardVO board, ShortsVO shorts, Model model,
			HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("user");
		
		List<BookMarkVO> bookMarkList = bookMarkService.getBookMarkList(bookMark);
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		List<ShortsVO> shortsList = new ArrayList<ShortsVO>();

		for (BookMarkVO BM : bookMarkList) {
			if (BM.getbSeq() != 0) {
				board.setbSeq(BM.getbSeq());
				boardService.myBoard(board);
				boardList.add(board);
			}
			if (BM.getsSeq() != 0) {
				shorts.setsSeq(BM.getsSeq());
				shortsService.getShorts(shorts);
				shortsList.add(shorts);
			}

		}

		model.addAttribute("bookMarkList", bookMarkList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("shortsList", shortsList);

		return "bookMarkList";
	}

	@GetMapping(value = "getBoardBookMarkList")
	public String getBoardBookMarkList(BookMarkVO bookMark, BoardVO board, Model model, HttpSession session) {
		List<BookMarkVO> boardBookMarkList = bookMarkService.getBoardBookMarkList(bookMark);

		model.addAttribute("boardBookMarkList", boardBookMarkList);

		return "boardBookMarkList";
	}

	@GetMapping(value = "getShortsBookMarkList")
	public String getShortsBookMarkList(BookMarkVO bookMark, ShortsVO shorts, Model model, HttpSession session) {
		List<BookMarkVO> shortsBookMarkList = bookMarkService.getShortsBookMarkList(bookMark);

		model.addAttribute("shortsBookMarkList", shortsBookMarkList);

		return "shortsBookMarkList";
	}

	@GetMapping(value = "getBookMark")
	public String getBookMark(BookMarkVO bookMark, Model model, HttpSession session) {
		MemberVO member = new MemberVO();
		member.setId(session.getId());
		bookMarkService.getBookMark(bookMark);

		return "getBookMark";
	}

}
