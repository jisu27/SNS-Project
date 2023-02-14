package com.ezen.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.AdminVO;
import com.ezen.service.AdminService;
import com.ezen.service.BoardService;
import com.ezen.service.ShortsService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ShortsService shortsService;
	
	@GetMapping("goAdmin.do")
	public String goAdmin(Model model) {
		
		List<AdminVO> list = adminService.viewAd();
		List<AdminVO> checkList = adminService.viewAd2();
		
		model.addAttribute("deAd",list);
		model.addAttribute("checkAd",checkList);
		
		return "adminPay";
	}
	
	@GetMapping("insertAD.do")
	public String insertAD(AdminVO vo) {
		System.out.println(vo);
		
		adminService.insertAd(vo);
		
		return "redirect:home.do";
	}
	
	@PostMapping("checkAd.do")
	public String checkAd(AdminVO avo) {
		
		System.out.println("avo=="+avo);
		
		if (avo.getbSeq() != 0) {
			boardService.updatePay(avo.getbSeq());
		}else {
			shortsService.updatePay(avo.getsSeq());
		}
		
		adminService.updateAdmin(avo.getaSeq());
		
		return "redirect:goAdmin.do";
	}
	
}
