package com.artirection.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	@RequestMapping("/write")
	public String write() {
		return "/board/write";
	}
}
