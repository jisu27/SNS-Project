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
import com.ezen.dto.ShortslikeVO;
import com.ezen.service.ShortsService;

@Controller
public class ShortsController {

	@Autowired
	private ShortsService shos;

	@RequestMapping("/getShorts")
	public String getShorts(ShortslikeVO likevo, ShortsVO vo, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		ShortsVO shorts = shos.getShorts(vo);
		model.addAttribute("shorts", shorts);

		System.out.println("--getShorts controller 실행: " + shorts);
		return "getShorts";

	}

	@RequestMapping("/getShortsList")
	public String getShortsList(HttpSession session, ShortsVO vo, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		// 검색기능
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		List<ShortsVO> list = shos.getShortsList(vo);

		model.addAttribute("shortsList", list);

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		return "getShortsList";

	}

	@GetMapping("/insertShorts")
	public String insertShortsView(ShortsVO vo, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {
			return "index";

		} else {

			return "insertShorts";
		}

	}

	@RequestMapping(value = "/insertShorts", method = RequestMethod.POST)
	public String insertShorts(ShortsVO vo, Model model, HttpSession session) throws IOException {

		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {

			return "index";

		} else {

			MultipartFile uploadFile = vo.getUploadFile();
			if (!uploadFile.isEmpty()) {

				String fileName = uploadFile.getOriginalFilename();

				uploadFile.transferTo(new File("C:/shorts/" + fileName));
				vo.setUpload(fileName);
				System.out.println("파일이름 :" + fileName);

			} else {
				System.out.println("파일이 없습니다");
				return "insertShorts";
			}

			vo.setId(user.getId());
			shos.insertShorts(vo);

			return "redirect:getShortsList";
		}

	}

	@GetMapping(value = "/updateShorts")
	public String updateShortsVeiws(ShortsVO vo, HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (!session.getAttribute("user").equals(vo.getId())) {

			return "index";
		} else {
			ShortsVO shorts = shos.getShorts(vo);

			model.addAttribute("shortsvo", shorts);
			return "updateShorts";
		}

	}

	@PostMapping(value = "/updateShorts")
	public String updateShorts(ShortsVO vo, HttpSession session) throws IOException {
		MemberVO user = (MemberVO) session.getAttribute("user");

		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {

			String fileName = uploadFile.getOriginalFilename();

			uploadFile.transferTo(new File("C:/shorts/" + fileName));
			vo.setUpload(fileName);
			System.out.println("파일이름 :" + fileName);

		} else {
			System.out.println("파일이 없습니다");
			return "updatetShorts";
		}

		if (!session.getAttribute("user").equals(vo.getId())) {
			return "index";

		} else {

			shos.updateShorts(vo);
			System.out.println("update controller 실행= " + "제목: " + vo.getsTitle() + " 내용: " + vo.getsContent());
			return "redirect:getShortsList";
		}

	}

	@RequestMapping("/deleteShorts")
	public String deleteShorts(ShortsVO vo, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		System.out.println("deleteShorts()..... vo=" + vo);

		if (!session.getAttribute("user").equals(vo.getId())) {
			return "index";
		} else {
			shos.deleteShorts(vo);
			return "redirect:getShortsList";

		}

	}

}
