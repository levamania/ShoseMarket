package com.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.RegAddrDTO;

public class MypageDAO {

	public int regAddrTotal(SqlSession session) {
		
		return session.selectOne("myPage.regAddrTotal");
	}

	public void insertAddr(SqlSession session, RegAddrDTO dto) {
		session.insert("myPage.insertAddr", dto);
	}

	public List<RegAddrDTO> getAddrList(SqlSession session, String userid) {
		return session.selectList("myPage.getAddrList", userid);
	}

	public RegAddrDTO searchByNo(SqlSession session, String delivno) {
		return session.selectOne("myPage.searchByNo", delivno);
	}

	public void modifyAddr(SqlSession session, RegAddrDTO dto) {
		session.insert("myPage.modifyAddr", dto);
	}
	

}
