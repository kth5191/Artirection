package com.artirection.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artirection.dto.BoardDTO;
import com.artirection.services.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("/writeProc")
	public String writeProc(String bTitle, String bContents) {
		BoardDTO dto = new BoardDTO();
		dto.setbTitle(bTitle);
		dto.setbContents(bContents);
		service.insert(dto);
		
		return "redirect:/";
	}
}
