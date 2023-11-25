package com.artirection.services;

import java.util.HashMap;
import java.util.Map;

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
	
	// 비밀번호 변경
	public int updatePW(String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);

		return mdao.updatePW(param);
	}
}
