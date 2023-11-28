package com.artirection.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artirection.dto.BoardDTO;
import com.artirection.dto.MemberDTO;
import com.artirection.services.BoardService;
import com.artirection.services.EmailService;
import com.artirection.services.MemberService;

import commons.EncryptionUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private EmailService EmailService;
	
	// 이메일 인증 번호
	String num = "";
	
	// 로그인 페이지 이동
	@RequestMapping("gologin")
	public String goLogin() {
		return "member/login";
	}
	
	// 로그인
	// ajax로 로그인 확인
	@ResponseBody
	@RequestMapping("login")
	public boolean login(String id, String pw) {
		
		String pwEnc = EncryptionUtils.getSHA256(pw);
		
		boolean result = mservice.login(id,pwEnc);
		
		if(result) {
			session.setAttribute("loginID", id);
		}
		
		return result;
	}
	
//	로그아웃
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {

		session.invalidate();
		return "redirect:/";

	}
	
	// 회원가입 페이지 이동
	@RequestMapping("goSignup")
	public String goSignup() {
		return "member/signup";
	}
	
	// 회원가입시 정보 받기
	@RequestMapping("signup")
	public String signup(MemberDTO dto) {
		
		// 비밀번호 암호화
		dto.setPw(EncryptionUtils.getSHA256(dto.getPw()));
		
		mservice.signup(dto);
		
		return "redirect:/member/gologin";
	}
	
	// 회원가입시 아이디 중복 확인
	@ResponseBody
	@RequestMapping("idDup")
	public String idDup(String mID) {
		int idDup = mservice.idDup(mID);
		
		// 중복되는 아이디가 없음
		if(idDup == 0) {
			return "중복안됨";
		}
		else {
			return "중복됨";
		}
		
	}
	
	// 비밀번호 찾기 페이지 이동
	@RequestMapping("gofindPw")
	public String gofindPW() {
		return "member/findPW";
	}
	
	//	이메일 전송 인증
	@ResponseBody
	@PostMapping("email")
	public String MailSend(String email) {
		System.out.println(email);

		System.out.println("Cont- 이메일 전송 완료");

		int number = EmailService.sendMail(email);

		num = "" + number;

		return "이메일 성공";
	}
	
//	코드 확인 인증
	@ResponseBody
	@PostMapping("emailChk")
	public String emailChk(String emailCode) {

		String emailSessionCode = session.getAttribute("emailCode") + "";

		if (emailCode.equals(emailSessionCode)) {
			return "true";
		}
		return "false";

	}
	
//	비밀번호 변경
	@RequestMapping("findPW")
	public String updatePW(String id, String pw) {
		
		System.out.println(pw);
		
		//암호화한거
		String pwEnc = EncryptionUtils.getSHA256(pw);
		mservice.updatePW(id, pwEnc);

		return "redirect:/member/gologin";
	}
	
	// 내정보 & 내기록
	@RequestMapping("myRecord")
	public String myRecode(Model model) {
		String loginID = (String) session.getAttribute("loginID");
		
		MemberDTO dto = mservice.selectById(loginID);
		List<BoardDTO> boardList = bservice.selectById(loginID);
		
		System.out.println(boardList.size());
		
		model.addAttribute("dto", dto);
		model.addAttribute("boardList", boardList);
		
		return "/member/myRecord";
	}
}
