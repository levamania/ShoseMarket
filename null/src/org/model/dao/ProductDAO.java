package org.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.dto.ProductDTO;

public class ProductDAO {

	public List<String> selectProduct_info(SqlSession session, HashMap<String, String> map) {
		return session.selectList("selectProduct_info", map);
	}

	public List<ProductDTO> selectProductList(SqlSession session, HashMap<String, String> reposit) {
		return session.selectList("selectProductList", reposit);
	}
	
}//end class
