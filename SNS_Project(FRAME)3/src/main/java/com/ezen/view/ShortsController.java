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
import com.ezen.dto.ShortsCommentVO;
import com.ezen.dto.ShortsVO;
import com.ezen.service.HeartService;
import com.ezen.service.MemberService;
import com.ezen.service.ShortsCommentService;
import com.ezen.service.ShortsService;

@Controller
public class ShortsController {

	@Autowired
	private ShortsService shos;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	@Autowired
	private ShortsCommentService ShortsCommentService;

	@RequestMapping("/getShorts")
	public String getShorts(ShortsVO vo, ShortsCommentVO scvo, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		ShortsVO shorts = shos.getShorts(vo);
		model.addAttribute("shorts", shorts);
		
		scvo.setsSeq(vo.getsSeq());
		List<ShortsCommentVO> ShortsCommentList = ShortsCommentService.getShortsCommentList(scvo);
		model.addAttribute("ShortsCommentList", ShortsCommentList);

		System.out.println("--getShorts controller �떎�뻾: " + shorts);
		System.out.println("ShortsCommentVO =" + scvo);
		System.out.println(ShortsCommentList);
		return "getShorts";

	}

	@RequestMapping("/getShortsList")
	public String getShortsList(HttpSession session, ShortsVO vo, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");

		List<ShortsVO> list = shos.getShortsList(vo);

		model.addAttribute("shortsList", list);

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		return "getShortsList";

	}

	@GetMapping("/insertShorts")
	public String insertShortsView(HttpSession session) {
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
				System.out.println("�뙆�씪�씠由� :" + fileName);

			} else {
				System.out.println("�뙆�씪�씠 �뾾�뒿�땲�떎");
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

		if (user == null) {

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
			System.out.println("�뙆�씪�씠由� :" + fileName);

		} else {
			System.out.println("�뙆�씪�씠 �뾾�뒿�땲�떎");
			return "updatetShorts";
		}

		if (user == null) {
			return "index";

		} else {

			shos.updateShorts(vo);
			System.out.println("update controller �떎�뻾= " + "�젣紐�: " + vo.getsTitle() + " �궡�슜: " + vo.getsContent());
			return "redirect:getShortsList";
		}

	}

	@RequestMapping("/deleteShorts")
	public String deleteShorts(ShortsVO vo, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		System.out.println("deleteShorts()..... vo=" + vo);

		if (user == null) {
			return "index";
		} else {
			shos.deleteShorts(vo);
			return "redirect:getShortsList";

		}

	}
}
