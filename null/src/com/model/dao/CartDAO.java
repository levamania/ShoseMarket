package com.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class CartDAO {
	//QUERY
	public List<HashMap<String, Object>> selectCartList(SqlSession session, HashMap<Object, Object> reposit) {
		return session.selectList("selectCartList",reposit);
	}

	//DML -- INSERT
	public int stackProduct(SqlSession session, List<HashMap<String, Object>> reposits) {
		return session.insert("stackProduct", reposits);
	}


}