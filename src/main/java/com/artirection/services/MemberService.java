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
		param.put("mID", id);
		param.put("pw", pw);

		return mdao.updatePW(param);
	}
	
	// 로그인
	public boolean login(String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		
		return mdao.login(param);
	}
	
	// 로그인 id로 내정보 확인
	public MemberDTO selectById(String id) {
		return mdao.selectById(id);
	}
	
	// 내정보 수정
	public int updateById(MemberDTO dto) {
		return mdao.updateById(dto);
	}
}
