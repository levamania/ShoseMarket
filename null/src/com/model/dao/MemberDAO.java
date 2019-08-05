package com.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public void memberAdd(SqlSession session, MemberDTO dto) {
		int n = session.insert("MemberMapper.memberAdd",dto);
		
	}

	public int idCheck(SqlSession session, String userid) {
		int num = session.selectOne("MemberMapper.idCheck",userid);
		return num;
	}

	public MemberDTO login(SqlSession session, HashMap<String, String> map) {
		MemberDTO dto = session.selectOne("MemberMapper.login", map);
		return dto;
	}

	public int IdPwCheck(SqlSession session, HashMap<String, String> map) {
		int num = session.selectOne("MemberMapper.IdPwCheck", map);
		return num;
	}



}
