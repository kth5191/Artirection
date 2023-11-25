package com.artirection.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artirection.dto.MemberDTO;
import com.artirection.services.MemberService;

import commons.EncryptionUtils;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService mservice;
	
	// 로그인 페이지 이동
	@RequestMapping("gologin")
	public String goLogin() {
		return "member/login";
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
	
	
////	ajax 로 로그인 됐는지 안됐는지 확인
//	@ResponseBody
//	@RequestMapping(value = "login", method = RequestMethod.POST)
//	public boolean login(String id, String pw) {
//
////		암호화한거
//		String pwEnc = EncryptionUtils.getSHA512(pw);
//		boolean result = mservice.login(id, pwEnc);
//
//		if (result) {
//			session.setAttribute("loginID", id);
//			System.out.println("login( ) : " + session.getAttribute("loginID"));
//		}
//
//		return result;
//	}
//
}
