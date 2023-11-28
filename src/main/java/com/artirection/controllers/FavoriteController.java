package com.artirection.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artirection.dto.FavoriteDTO;
import com.artirection.services.FavoriteService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/favorite/")
public class FavoriteController {
	@Autowired
	private HttpSession session;
	@Autowired
	private FavoriteService service;

	//찜 목록에 추가
	@ResponseBody
	@RequestMapping("insert")
	public void insertFavorite(int seq) {
		String mID = (String) session.getAttribute("loginID");
		service.insert(new FavoriteDTO(0, mID, seq));
		
		return;
	}
}
