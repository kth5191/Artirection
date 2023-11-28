package com.artirection.dao;

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
}
