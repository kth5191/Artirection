package com.artirection.controllers;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping("write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(BoardDTO dto) throws Exception {
		String writer = (String) session.getAttribute("loginID");
		dto.setbID(writer);

		service.insert(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping("favorite")
	public String favorite() {
		return "/board/favorite";
	}
}
