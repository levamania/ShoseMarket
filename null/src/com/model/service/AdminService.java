package com.model.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.model.dao.AdminDAO;

public class AdminService {
	private AdminDAO adminDAO=null;
	
	public AdminService() {
		adminDAO=new AdminDAO();
	}

	

	public String searchPcodeByPname(String pname) {
		SqlSession session = MySqlSessionFactory.getSession();
		String pcode = null;
		try {
			pcode = adminDAO.searchPcodeByPname(session,pname);
		} finally {
			session.close();
		}
		return pcode;
	}

	public String searchPnameByPcode(String pcode) {
		SqlSession session = MySqlSessionFactory.getSession();
		String pname = null;
		try {
			pname = adminDAO.searchPnameByPcode(session,pcode);
		} finally {
			session.close();
		}
		return pname;
	}
	
	
}
