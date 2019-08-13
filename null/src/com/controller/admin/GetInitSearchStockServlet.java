package com.controller.admin;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dto.ProductDTO;
import com.model.service.AdminService;

@WebServlet("/GetInitSearchStockServlet")
public class GetInitSearchStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		AdminService service = new AdminService();

//		HashMap<String, List<String>> map = new HashMap<String, List<String>>();
//		map = service.getSearchStockOptions();

		// 검색 키워드 생성
		List<String> keywordList = service.searchPname();
		JSONObject jsonObject = new JSONObject();

//		JSONArray styletopOptions = new JSONArray();
//		JSONArray stylemidOptions = new JSONArray();
//		JSONArray stylebotOptions = new JSONArray();
		JSONArray keywords = new JSONArray();

//		List<String> styletopList = map.get("styletop");
//		List<String> stylemidList = map.get("stylemid");
//		List<String> stylebotList = map.get("stylebot");
//		
//		styletopList.stream().forEach(s->{
//			JSONObject obj = new JSONObject();
//			obj.put("option", s);
//			styletopOptions.add(obj);
//		});
//		stylemidList.stream().forEach(s->{
//			JSONObject obj = new JSONObject();
//			obj.put("option", s);
//			stylemidOptions.add(obj);
//		});
//		stylebotList.stream().forEach(s->{
//			JSONObject obj = new JSONObject();
//			obj.put("option", s);
//			stylebotOptions.add(obj);
//		});
		keywordList.stream().forEach(s -> {
			JSONObject obj = new JSONObject();
			obj.put("keyword", s);
			keywords.add(obj);
		});
//		jsonObject.put("styletop", styletopOptions);
//		jsonObject.put("stylemid", stylemidOptions);
//		jsonObject.put("stylebot", stylebotOptions);
		jsonObject.put("keywords", keywords);
		System.out.println(jsonObject);
		out.print(jsonObject);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
