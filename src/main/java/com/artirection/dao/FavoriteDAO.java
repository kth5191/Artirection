package com.artirection.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.artirection.dto.FavoriteDTO;

@Repository
public class FavoriteDAO {
	@Autowired
	private SqlSession db;
	
	public int insert(FavoriteDTO dto) {
		return db.insert("Favorite.insert", dto);
	}
	
	public int delete(FavoriteDTO dto) {
		return db.delete("Favorite.delete", dto);
	}
	
	public List<String> selectById(String id) {
		return db.selectList("Favorite.selectById", id);
	}
}
