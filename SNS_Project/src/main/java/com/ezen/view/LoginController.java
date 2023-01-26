package com.ezen.view;

import javax.servlet.http.HttpSession;


import org.aspectj.weaver.NewMemberClassTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dto.MemberVO;
import com.ezen.service.MemberService;


@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String goHome() {
		
		return"index";
	}
//	##############################################################################################################--goInsertMember
	@GetMapping("/goInsertMember.do")
	public String goInsertMember() {
		
		return "NewMember";
	}
// ##############################################################################################################--check.do	
	@GetMapping("/check.do")
	public String goIdCheck(Model model) {
		
		model.addAttribute("msg","");
		model.addAttribute("check",0);
		model.addAttribute("id","");
		
		return "check_id";
	}
//	##############################################################################################################--IdCheck
	@PostMapping("/idCheck.do")
	public String check_id(MemberVO vo,Model model) {
		
	MemberVO mvo = memberService.MemberCheck(vo);
	System.out.println(vo);
	System.out.println(mvo);
	
		if (mvo == null) {
			
			model.addAttribute("msg","사용가능한 아이디 입니다.");
			model.addAttribute("id",vo.getId());
			model.addAttribute("check",1);
			
		}else {
			model.addAttribute("msg","이미 사용중인 아이디 입니다.");
			model.addAttribute("id",vo.getId());
			model.addAttribute("check",0);
		}
		
		return "check_id";
		
	}
//	##############################################################################################################--insertMember
	@PostMapping("/insertMember.do")
	public String insertMember(MemberVO vo) {
		
		memberService.insertMember(vo);
		
		return "index";
	}
//	##############################################################################################################--login.do
	@PostMapping("/login.do")
	public String login(MemberVO vo,HttpSession session) {
		String url ="";
		MemberVO mvo;
		
		//System.out.println(vo);
		
		mvo = memberService.MemberCheck(vo);
//		System.out.println(vo);
		
		
		if(vo.getPwd().equals(mvo.getPwd())) {
			session.setAttribute("user",mvo);
			
			if(mvo.getRole()==1) {
				url="redirect:home.do";				
			}else {
				url="/admin";
			}
			
		}else {
			url="redirect:/";
		}

		return url;
	}
	
//	##############################################################################################################--goFIndId
	
	@GetMapping("/goFindId.do")
	public String goFindId(Model model) {
		 
		model.addAttribute("id","");
		model.addAttribute("pwd","");
		
		return "findId";
	}
	
//	##############################################################################################################--FindID.do
	@PostMapping("/findId.do")
	public String FindIdAction(MemberVO vo,Model model) {
		
		MemberVO mvo = memberService.findId(vo);
		
		System.out.println(vo);
		System.out.println(mvo);
		
		if(mvo != null) {
			model.addAttribute("id","찾으시는 아이디는"+mvo.getId()+"입니다.");
		}else {
			model.addAttribute("id","찾으시는 아이디가 없습니다.");
		}
		
		return "findId";
	}
	@PostMapping("/findPwd.do")
	public String FindPwdAction(MemberVO vo,Model model) {
		
		MemberVO mvo = memberService.findPwd(vo);
		System.out.println(vo);
		System.out.println(mvo);
		
		if(mvo != null) {
			model.addAttribute("pwd","찾으시는 비밀번호는"+mvo.getPwd()+"입니다.");
		}else {
			model.addAttribute("pwd","찾으시는 비밀번호가 없습니다.");
		}
		
		return "findId";
	}
	
//	##############################################################################################################--myPage.do
	@GetMapping("/myPage.do")
	public String goMyPage() {
		
		return "myPage";
	}
}









































