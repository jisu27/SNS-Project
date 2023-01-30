package com.ezen.view;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Savepoint;
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
//	##############################################################################################################--goInsertBoard
	@GetMapping("getBoard.do")
	public String getBoard(BoardVO vo,Model model) {
		
		BoardVO board= (BoardVO) boardService.myBoard(vo);
		model.addAttribute("board",board);
		
		return "getBoard";
	}
//	##############################################################################################################--insertBoard
	@RequestMapping("/insertBoard.do")
	public String InsertBoard(BoardVO vo, HttpSession session) throws IllegalStateException, IOException {
		
		String fileName = "";
		
		if(!vo.getUploadfile().isEmpty()) {
			fileName = vo.getUploadfile().getOriginalFilename();
			
			System.out.println("filename=" + fileName);
			
			String realPath = session.getServletContext().getRealPath("WEV-INF/resources/images/");
			vo.setUpload(fileName);
			vo.getUploadfile().transferTo(new File(realPath+fileName));
		}
		
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
