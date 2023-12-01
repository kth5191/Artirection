package com.artirection.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.artirection.dto.CategoryCountDTO;
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
	
	// 빈도수 높은 찜 분류 가져오기
	public String selectCategoryById(String id) {
		return db.selectOne("Favorite.selectCategoryById", id);
	}
	
	// 나의 모든 찜 목록 가져오기
	public List<FavoriteDTO> selectAllById(String id) {
		return db.selectList("Favorite.selectAllById", id);
	}
	
	// 찜의 분류와 숫자 가져오기
	public List<CategoryCountDTO> getCategoryById(String id) {
		return db.selectList("Favorite.getCategoryById", id);
	}
}
