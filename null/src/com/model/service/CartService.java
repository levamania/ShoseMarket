package com.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.model.dao.CartDAO;

public class CartService {
	private CartDAO dao;
	
	public int stackProduct(List<HashMap<String, Object>> reposits) {
		SqlSession session = null;
		dao = new CartDAO();
		int result = 0;
		try {
			session = MySqlSessionFactory.getSession();
			result = dao.stackProduct(session,reposits);
			session.commit();
		}finally {
			if(session!=null)session.close();
		}
		return result;
	}
}
