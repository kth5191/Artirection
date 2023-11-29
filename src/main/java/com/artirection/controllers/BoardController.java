package com.artirection.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artirection.dto.BoardDTO;
import com.artirection.services.BoardService;
import com.artirection.services.FavoriteService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardService service;
	@Autowired
	private FavoriteService Fservice;
	
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
	public String favorite(Model model) {
		String id = (String) session.getAttribute("loginID");
		
		List<String> seqList = Fservice.selectById(id);
		
		model.addAttribute("seqList", seqList);
		
		System.out.println(seqList);
		
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
