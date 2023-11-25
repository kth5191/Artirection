package com.artirection.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.artirection.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession db;
	
	// 회원가입
	public int signup(MemberDTO dto) {
		return db.insert("member.signup", dto);
	}
	
	// 회원가입시 아이디 중복 확인
	public int idDup(String mID) {
		return db.selectOne("member.idDup",mID);
	}
}
