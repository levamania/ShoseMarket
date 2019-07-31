package com.model.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;

import com.dto.MemberDTO;
import com.model.dao.MemberDAO;


public class MemberService {

	public void memberAdd(MemberDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		MemberDAO dao = new MemberDAO();
		try {
			dao.memberAdd(session,dto);
			session.commit();
			
		} finally {
			session.close();
		}
		
		
	}

}
