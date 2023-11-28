package com.artirection.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.artirection.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession db;
	
	//로그인
	public boolean login(Map<String,String> param) {
		return db.selectOne("member.login",param);
	}
	
	// 회원가입
	public int signup(MemberDTO dto) {
		return db.insert("member.signup", dto);
	}
	
	// 회원가입시 아이디 중복 확인
	public int idDup(String mID) {
		return db.selectOne("member.idDup",mID);
	}
	
	// 비밀번호 변경
	public int updatePW(Map<String, String> param) {
		return db.update("member.updatePW", param);
	}
	
	// 로그인 id로 내정보 확인
	public MemberDTO selectById(String id) {
		return db.selectOne("member.selectById", id);
	}
	
	// 내정보 수정
	public int updateById(MemberDTO dto) {
		return db.update("member.updateById", dto);
	}
}
