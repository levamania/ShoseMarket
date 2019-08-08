package com.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.StockDTO;
import com.util.SessionCheckInterface;

public class AdminDAO {

	public int searchPname(SqlSession session, String pname) {
		return session.selectOne("com.dto.Admin.searchPname", pname);
	}

	public int searchPcode(SqlSession session, String pcode) {
		return session.selectOne("com.dto.Admin.searchPcode", pcode);
	}

	public String searchPcodeByPname(SqlSession session, String pname) {
		return session.selectOne("com.dto.Admin.searchPcodeByPname", pname);
	}

	public String searchPnameByPcode(SqlSession session, String pcode) {
		return session.selectOne("com.dto.Admin.searchPnameByPcode", pcode);
	}

	public int insertStock(SqlSession session, StockDTO stock) {
		return session.insert("com.dto.Admin.insertStock", stock);
	}

	public int searchSCode(SqlSession session, String scode) {
		return session.selectOne("com.dto.Admin.searchSCode", scode);
	}

	public int updateStock(SqlSession session, StockDTO stock) {
		return session.update("com.dto.Admin.updateStock", stock);
	}

	

	

	
}
