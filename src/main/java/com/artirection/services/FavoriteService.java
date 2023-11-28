package com.artirection.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artirection.dao.FavoriteDAO;
import com.artirection.dto.FavoriteDTO;

@Service
public class FavoriteService {
	@Autowired
	private FavoriteDAO fdao;
	
	public int insert(FavoriteDTO dto) {
		return fdao.insert(dto);
	}
}
