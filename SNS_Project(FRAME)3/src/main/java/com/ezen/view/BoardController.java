package com.ezen.view;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.dto.BoardVO;
import com.ezen.dto.CommentVO;
import com.ezen.dto.FollowVO;
import com.ezen.dto.HeartVO;
import com.ezen.dto.MemberVO;
import com.ezen.dto.ShortsVO;
import com.ezen.service.BoardService;
import com.ezen.service.CommentService;
import com.ezen.service.FollowService;
import com.ezen.service.HeartService;
import com.ezen.service.MemberService;
import com.ezen.service.ShortsService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ShortsService shortsService;
	@Autowired
	private FollowService followService;


}