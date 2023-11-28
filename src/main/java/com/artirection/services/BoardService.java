package com.artirection.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artirection.dao.BoardDAO;
import com.artirection.dto.BoardDTO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO bdao;
	
	public int insert(BoardDTO dto) {
		return bdao.insert(dto);
	}
	
	// 로그인정보로 작성 리뷰 검색(마이페이지용)
	public List<BoardDTO> selectById(String id) {
		return bdao.selectById(id);
	}
}
