package com.model.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.StockDTO;
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



	public int insertStock(StockDTO stock) {
		SqlSession session = MySqlSessionFactory.getSession();
		
		int num = 0;
		try {
			String scode = stock.getsCode();
			int check = adminDAO.searchSCode(session,scode);
			if(check==0) {
				num = adminDAO.insertStock(session,stock);
			}else {
				num = adminDAO.updateStock(session,stock);
			}
			
			session.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.rollback();
		}finally {
			session.close();
		}
		return num;
	}
	
	
}
