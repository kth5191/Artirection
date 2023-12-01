package com.artirection.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artirection.dao.FavoriteDAO;
import com.artirection.dto.CategoryCountDTO;
import com.artirection.dto.FavoriteDTO;

@Service
public class FavoriteService {
	@Autowired
	private FavoriteDAO fdao;
	
	public int insert(FavoriteDTO dto) {
		return fdao.insert(dto);
	}
	
	public int delete(FavoriteDTO dto) {
		return fdao.delete(dto);
	}
	
	public List<String> selectById(String id) {
		return fdao.selectById(id);
	}
	
	// 나의 모든 찜 목록 가져오기
	public List<FavoriteDTO> selectAllById(String id) {
		return fdao.selectAllById(id);
	}
	
	// 빈도수 높은 찜 분류 가져오기
	public String selectCategoryById(String loginID) {
		return fdao.selectCategoryById(loginID);
	}
	
	public List<CategoryCountDTO> getCategoryById(String id) {
		return fdao.getCategoryById(id);
	}
}
