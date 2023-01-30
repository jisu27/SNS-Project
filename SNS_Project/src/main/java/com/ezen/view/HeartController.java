package com.ezen.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.HeartVO;
import com.ezen.service.HeartService;

@Controller
public class HeartController {

	
	@Autowired
	private HeartService heartService;
	
	@PostMapping("heart.do")
	public String insertLike(HeartVO vo,Model model,HttpSession session){
		
		vo.setUse_like("y");
		heartService.insertLike(vo);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:getBoard.do?bSeq="+vo.getBseq();
	}
	
	@PostMapping("deleteHeart.do")
	public String deleteLike(HeartVO vo,HttpSession session) {
		
		heartService.deleteLike(vo);
		
		List<HeartVO> heart = heartService.boardLike(vo);
		session.setAttribute("heart",heart);
		
		return"redirect:getBoard.do?bSeq="+vo.getBseq();
	}
}
