package org.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.model.service.ProductService;
import org.util.MapParamInputer;

@WebServlet("/SizeGetterServlet")
public class SizeGetterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//propriating
		String pCode = request.getParameter("pCode");
		System.out.println(pCode);
		HashMap<String, String> map = MapParamInputer.set("size",true,"pCode",pCode);
		System.out.println(map);
		//with model
		ProductService service = new ProductService();
		List<String> size_list = service.getProduct_info(map);
		size_list = size_list.stream().map((atom)->"\""+atom+"\"").collect(Collectors.toList());
		//print
		PrintWriter out = response.getWriter();
		out.print(size_list);
		System.out.println(size_list);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
