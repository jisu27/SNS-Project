package com.ezen.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.dto.BookMarkVO;
import com.ezen.service.BookMarkService;

@Controller
public class BookMarkController {
	@Autowired
	private BookMarkService bookMarkService;
	
	@PostMapping(value="insertBookMark")
	public String insertBookMark(BookMarkVO vo, Model model) {
		bookMarkService.insertBookMark(vo);
		
		return "bookMarkList";
	}
	
}
