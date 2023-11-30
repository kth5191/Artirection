package com.artirection.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artirection.dao.BoardDAO;
import com.artirection.dto.BoardDTO;
import com.artirection.dto.CategoryCountDTO;

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
	
	// 공연번호로 작성 리뷰 검색
	public List<BoardDTO> selectBySeq(String seq) {
		return bdao.selectBySeq(seq);
	}
	
	public List<CategoryCountDTO> getCategoryById(String id) {
		return bdao.getCategoryById(id);
	}
	
	public BoardDTO selectByBSeq(String bSeq) {
		return bdao.selectBybSeq(bSeq);
	}
}
