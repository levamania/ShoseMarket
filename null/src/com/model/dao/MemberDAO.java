package com.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public void memberAdd(SqlSession session, MemberDTO dto) {
		int n = session.insert("MemberMapper.memberAdd",dto);
		
	}

}
