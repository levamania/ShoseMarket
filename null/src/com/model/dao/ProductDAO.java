package com.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ProductDTO;
import com.dto.StockDTO;

public class ProductDAO {
	//products info
	public List<String> selectProducts_info(SqlSession session, HashMap<String, String> map) {
		return session.selectList("selectProducts_info", map);
	}
	//product info
	public List<StockDTO> selectProduct_info(SqlSession session, HashMap<String, String> map) {
		return session.selectList("selectProduct_info",map);
	}

	public List<ProductDTO> selectProductList(SqlSession session, HashMap<String, Object> reposit) {
		return session.selectList("selectProductList", reposit);
	}

	
}//end class
