package com.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dto.ProductDTO;
import com.model.dao.ProductDAO;

public class ProductService {
	ProductDAO dao;
	//DAO get
	public ProductService(){
		dao = new ProductDAO();
	}
	
	//product info - style, size, 
	public List<String> getProduct_info(HashMap<String, String> map) {
		List<String> list = null;
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.getSession();
			list = dao.selectProduct_info(session,map);
			session.commit();
		}finally {
			if(session!=null)session.close();
		}
		return list;
	}

	//product list - searching
	public List<ProductDTO> selectProductList(HashMap<String, String> reposit) {
		List<ProductDTO> list = null;
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.getSession();
			list = dao.selectProductList(session,reposit);
			session.commit();
		}finally {
			if(session!=null)session.close();
		}
		return list;
	}

}//end class
