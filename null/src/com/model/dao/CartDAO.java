package com.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class CartDAO {

	public int stackProduct(SqlSession session, List<HashMap<String, Object>> reposits) {
		return session.insert("stackProduct", reposits);
	}

}
