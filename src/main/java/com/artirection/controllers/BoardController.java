package com.artirection.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artirection.dto.BoardDTO;
import com.artirection.services.BoardService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardService service;
	// 글 작성 페이지
	@RequestMapping("write")
	public String write() {
		return "/board/write";
	}
	// 글 작성하기
	@RequestMapping("writeProc")
	public String writeProc(BoardDTO dto) throws Exception {
		String writer = (String) session.getAttribute("loginID");
		dto.setbID(writer);

		service.insert(dto);
		
		return "redirect:/";
	}
	// 찜한목록 이동
	@RequestMapping("favorite")
	public String favorite() {
		return "/board/favorite";
	}
	// 상세페이지 이동
	@RequestMapping("detail")
	public String detail(Model model, String seq) {
		model.addAttribute("seq", seq);
		
		System.out.println(seq);
		
		return "/board/detail";
	}
}
