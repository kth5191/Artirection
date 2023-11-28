package com.artirection.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.artirection.dto.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession db;
	
	public int insert(BoardDTO dto) {
		return db.insert("Board.insert", dto);
	}
	
	public List<BoardDTO> selectById(String id) {
		return db.selectList("Board.selectById", id);
	}
}
