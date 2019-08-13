package com.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.dto.ProductDTO;
import com.model.service.AdminService;

@WebServlet("/AutoInputInfoServlet")
public class AutoInputInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   //pname으로 product 검색 
	//ajax 응답
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain;charset=utf-8");
		AdminService service = new AdminService();
		String pname = request.getParameter("pname");
		if (pname != null) {
			ProductDTO product = service.searchProduct(pname);
			if(product==null) {
				out.print(0);
			}else {
				JSONObject productInfo = new JSONObject();
				productInfo.put("pcode", product.getpCode());
				productInfo.put("styletop", product.getStyleTop());
				productInfo.put("stylemid", product.getStyleMid());
				productInfo.put("stylebot", product.getStyleBot());
				productInfo.put("pregitdate", product.getpRegitDate());
				out.print(productInfo);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
