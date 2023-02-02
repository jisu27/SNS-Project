package com.ezen.view;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.dto.AdvertisementVO;
import com.ezen.dto.BoardVO;
import com.ezen.dto.CommentVO;
import com.ezen.dto.HeartVO;
import com.ezen.dto.MemberVO;
import com.ezen.dto.ShortsVO;
import com.ezen.service.AdvertiseService;
import com.ezen.service.BoardService;
import com.ezen.service.CommentService;
import com.ezen.service.HeartService;
import com.ezen.service.MemberService;
import com.ezen.service.ShortsService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private AdvertiseService advertiseService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ShortsService shortsService;
//	##############################################################################################################--home
	
	@RequestMapping(value="/home.do")
	public String BoardList(AdvertisementVO aVo,BoardVO bVo ,CommentVO cVo,Model model) {

		List<BoardVO> boardList = boardService.BoardList(bVo);
		List<AdvertisementVO> adverList = advertiseService.AdverList(aVo);
		List<MemberVO> memberList =  new ArrayList<>();
		List<Integer> likeList =  new ArrayList<>();
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		List<String> time =  new ArrayList<>();
		
		
		for(BoardVO vo : boardList) {
			
			 LocalDate boarDate = vo.getInDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	         Period btn = Period.between(boarDate,LocalDate.now());
	         String btnTime;
	         
	         if (btn.getYears()!=0) {
	             btnTime = btn.getYears()+"년"+btn.getMonths()+"월"+btn.getDays()+"일 전";
	         }else if (btn.getMonths()!=0) {
	             btnTime = btn.getMonths()+"월"+btn.getDays()+"일 전";
	         }else {
	             btnTime = btn.getDays()+"일 전";
	         }
	         
	         time.add(btnTime);
			
			MemberVO mvo = new MemberVO();
			mvo.setId(vo.getId());
			
			MemberVO v1 = memberService.MemberCheck(mvo);
			memberList.add(v1);
			
			HeartVO hvo = new HeartVO();
			hvo.setBseq(vo.getbSeq());
			
			int like = heartService.likeCount(hvo); 
			likeList.add(like);
			
			cVo.setBseq(vo.getbSeq());
			List<CommentVO> cvo = commentService.getCommentList(cVo);	
			commentList.addAll(cvo);
			
		}
		
		model.addAttribute("time",time);
		model.addAttribute("memberList",memberList);
		model.addAttribute("likeList",likeList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("adverList",adverList);
		model.addAttribute("commentList", commentList);
		
		System.out.println(boardList);
		System.out.println("commentList :" + commentList);
		
		return "home";
	}
//	##############################################################################################################--goInsertBoard
	@GetMapping("goInsertBoard.do")
	public String goInsertBoard() {
		
		return "insertBoard";
	}
//	##############################################################################################################--updateBoard
	@RequestMapping("/updateBoard.do")
	public String UpdateBoard(
			@RequestParam(value="nonImg") String org_image,
			BoardVO vo, HttpSession session) throws IllegalStateException, IOException {
		
		String fileName = "";
		System.out.println("UpdateBoard()=vo"+vo);
		if(!vo.getUploadfile().isEmpty()) {
			fileName = vo.getUploadfile().getOriginalFilename();
			
			System.out.println("filename=" + fileName);
			
			String realPath = session.getServletContext().getRealPath("WEV-INF/resources/images/");
			vo.setUpload(fileName);
			vo.getUploadfile().transferTo(new File(realPath+fileName));
		} else {
			vo.setUpload(org_image);
		}
		
		System.out.println("UpdateBoard().vo="+vo);
		boardService.updateBoard(vo);
		
		return "redirect:home.do";
	}
//	##############################################################################################################--goInsertBoard
	@GetMapping("getBoard.do")
	public String getBoard(MemberVO mvo,CommentVO cvo, BoardVO bvo,Model model,HttpSession session) {
		
		BoardVO board= (BoardVO) boardService.myBoard(bvo);
		model.addAttribute("board",board);
		model.addAttribute("profile",mvo.getProfile());
		
		cvo.setBseq(bvo.getbSeq());
		List<CommentVO> commentList = commentService.getCommentList(cvo);
		model.addAttribute("commentList", commentList);
		
		System.out.println("commentList :" + commentList);
		System.out.println("cvo :" + cvo);
		
		
		return "getBoard";
	}
//	##############################################################################################################--insertBoard
	@PostMapping("insertBoard.do")
	public String InsertBoard(BoardVO vo, HttpSession session) throws IllegalStateException, IOException{
		
		String fileName = "";
		
		if(!vo.getUploadfile().isEmpty()) {
			fileName = vo.getUploadfile().getOriginalFilename();
			
			System.out.println("filename=" + fileName);
			
			String realPath = session.getServletContext().getRealPath("/images/");
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
