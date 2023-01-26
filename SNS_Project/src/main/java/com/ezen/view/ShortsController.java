package com.ezen.view;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.dto.MemberVO;
import com.ezen.dto.ShortsVO;
import com.ezen.service.ShortsService;


@Controller
public class ShortsController {
	
	@Autowired
	private ShortsService shos;
	
	@RequestMapping("/getShorts")
	public String getShorts(ShortsVO vo, Model model) {
		
		ShortsVO shorts = shos.getShorts(vo);
		model.addAttribute("shorts", shorts);
		
		return "getShorts";
		
	}
	
	@RequestMapping("/getShortsList")
	public String getShortsList(ShortsVO vo, Model model) {
		
		List<ShortsVO> list =  shos.getShortsList(vo);
		
		model.addAttribute("shortsList", list);
		return "getShortsList";
		
	}
	
	@GetMapping("/insertShorts")
	public String insertShortsView(HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		return "insertShorts";
	}
	
	
	@RequestMapping(value= "/insertShorts", method=RequestMethod.POST )
	public String insertShorts(ShortsVO vo, HttpSession session) throws IOException{
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			
			String fileName = uploadFile.getOriginalFilename();
			
			uploadFile.transferTo(new File("D:/shorts/" + fileName));
			vo.setUpload(fileName);
			System.out.println("파일이름 :" + fileName);
			
		} else {
			System.out.println("파일이 없습니다");
			return "insertShorts";
		}
		
		vo.setId(user.getId()); 
		shos.insertShorts(vo);

		return "getShortsList";
		
	}
	
	@PostMapping(value="updateShorts" )
	public String updateShorts(ShortsVO vo) {
		
		shos.updateShorts(vo);
		
		return "redirect:getShortsList";
		
	}
	
	@RequestMapping("/deleteShorts")
	public String deleteShorts(ShortsVO vo) {
		shos.deleteShorts(vo);
		return "redirect:getShortsList";
		
	}
}
