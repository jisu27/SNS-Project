package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.dto.AdvertisementVO;
import com.ezen.dto.BoardVO;

import com.ezen.dto.MemberVO;

import com.ezen.service.AdvertiseService;

import com.ezen.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	

//	##############################################################################################################--home
	
	@Autowired
	private AdvertiseService advertiseService;
	
	@RequestMapping(value="/home.do")
	public String BoardList(AdvertisementVO aVo,BoardVO bVo ,Model model) {

		
		List<BoardVO> boardList = boardService.BoardList(bVo);
		List<AdvertisementVO> adverList = advertiseService.AdverList(aVo);
		
		model.addAttribute("boardList",boardList);

		System.out.println(boardList);
		

		model.addAttribute("adverList",adverList);
		
		System.out.println(adverList);

		return "home";
	}
//	##############################################################################################################--goInsertBoard
	@GetMapping("goInsertBoard.do")
	public String goInsertBoard() {
	
		return "insertBoard";
	}
//	##############################################################################################################--insertBoard
	@PostMapping("insertBoard.do")
	public String InsertBoard(BoardVO vo) {
		
		System.out.println(vo);
		
		boardService.InsertBoard(vo);
		
		return "redirect:home.do";
	}
////	##############################################################################################################--myPage.do
//	@GetMapping("/myPage.do")
//	public String goMyPage(BoardVO vo,Model model) {
//		
//		List<BoardVO> list	= boardService.myBoardList(vo);
//		model.addAttribute("boardList",list);	
//	
//		return "myPage";
//	}
	
	
	
}
