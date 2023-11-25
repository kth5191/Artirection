package com.artirection.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artirection.dao.MemberDAO;
import com.artirection.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	// 회원가입
	public int signup(MemberDTO dto) {
		return mdao.signup(dto);
	}
	
	// 회원가입시 아이디 중복 확인
	public int idDup(String mID) {
		return mdao.idDup(mID);
	}
}
