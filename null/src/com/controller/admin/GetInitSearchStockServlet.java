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
		
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		AdminService service = new AdminService();
		// 검색 키워드 생성
		
		String pname = request.getParameter("pname");
		if (pname != null) { 
			ProductDTO product = service.searchProduct(pname);
			if(product==null) {
				
			}else {
				JSONObject productInfo = new JSONObject();
				productInfo.put("pcode", product.getpCode());
				productInfo.put("styletop", product.getStyleTop());
				productInfo.put("stylemid", product.getStyleMid());
				productInfo.put("stylebot", product.getStyleBot());
				productInfo.put("pregitdate", product.getpRegitDate());
				out.print(productInfo);
			}
		}else {
			List<String> keywordList = service.searchPname();
			JSONObject jsonObject = new JSONObject();


			JSONArray keywords = new JSONArray();


			keywordList.stream().forEach(s -> {
				JSONObject obj = new JSONObject();
				obj.put("keyword", s);
				keywords.add(obj);
			});

			jsonObject.put("keywords", keywords);
			System.out.println(jsonObject);
			out.print(jsonObject);
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
