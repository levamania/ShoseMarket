package com.model.dao;

import org.apache.ibatis.session.SqlSession;

public class AdminDAO {

	public int searchPname(SqlSession session, String pname) {
		return session.selectOne("com.dto.Admin.searchPname", pname);
	}

	public int searchPcode(SqlSession session, String pcode) {
		return session.selectOne("com.dto.Admin.searchPcode", pcode);
	}

	public String searchPcodeByPname(SqlSession session, String pname) {
		return session.selectOne("com.dto.Admin.searchPcodeByPname", pname);
	}

	public String searchPnameByPcode(SqlSession session, String pcode) {
		return session.selectOne("com.dto.Admin.searchPnameByPcode", pcode);
	}

	

	
}
