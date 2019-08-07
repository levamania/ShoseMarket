package com.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.OrderEvalListDTO;
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

	public void deleteDelivnos(SqlSession session, List<String> delivnos) {
		session.delete("myPage.deleteDelivnos",delivnos);
	}

	public int searchPwdById(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("myPage.searchPwdById", map);
	}
	
	public MemberDTO searchMemberById(SqlSession session,String userid) {
		return session.selectOne("myPage.searchMemberById", userid);
	}

	public void modifyAccountInfo(SqlSession session, HashMap<String, String> member) {
		session.update("myPage.modifyAccountInfo", member);
	}

	public List<OrderDTO> getOrderList(SqlSession session, HashMap<String, String> map) {
		return session.selectList("myPage.getOrderList", map);
	}

	public List<OrderEvalListDTO> getOrderEvalList(SqlSession session, String userid) {
		return session.selectList("myPage.getOrderEvalList", userid);
	}

}
