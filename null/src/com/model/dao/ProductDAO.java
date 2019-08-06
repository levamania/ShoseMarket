package com.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ProductDTO;
import com.dto.StockDTO;

public class ProductDAO {
	//products info -- product column data list
	public List<String> selectProducts_info(SqlSession session, HashMap<String, String> map) {
		return session.selectList("selectProducts_info", map);
	}
	//product info -- 스톡 리스트
	public List<HashMap<String, Object>> selectProduct_info(SqlSession session, HashMap<String, Object> map) {
		return session.selectList("selectProduct_info",map);
	}
	
	//product -- 제품(모델) 리스트
	public List<HashMap<String, Object>> selectProductList(SqlSession session, HashMap<String, Object> reposit) {
		return session.selectList("selectProductList", reposit);
	}
	
	
	//DML - UPDATE
	public int updateProducts(SqlSession session, List<HashMap<String, Object>> reposits) {
		return session.update("updateProducts", reposits);
	}

	
}//end class
