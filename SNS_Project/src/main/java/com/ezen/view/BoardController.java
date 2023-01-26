package com.ezen.view;

import java.util.List;

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
import com.ezen.service.AdvertiseService;
import com.ezen.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AdvertiseService advertiseService;
	
	@RequestMapping(value="/home.do")
	public String BoardList(AdvertisementVO aVo,BoardVO bVo ,Model model) {
		
		List<BoardVO> boardList = boardService.BoardList(bVo);
		List<AdvertisementVO> adverList = advertiseService.AdverList(aVo);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("adverList",adverList);
		
		System.out.println(adverList);
		return "home";
	}
}
