package com.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.RegAddrDTO;
import com.model.dao.MypageDAO;

public class MyPageService {
	private MypageDAO mypageDAO;
	public MyPageService() {
		mypageDAO = new MypageDAO();
	}
	public void addAddr(RegAddrDTO dto) {
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int num = mypageDAO.regAddrTotal(session)+1;
			dto.setDelivno(num);
			mypageDAO.insertAddr(session,dto);
			session.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.rollback();
		}finally {
			session.close();
		}
	}
	public List<RegAddrDTO> getAddrList(String userid) {
		List<RegAddrDTO> list= null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			list = mypageDAO.getAddrList(session,userid);
		} finally {
			session.close();
		}
		return list;
	}
	
}
