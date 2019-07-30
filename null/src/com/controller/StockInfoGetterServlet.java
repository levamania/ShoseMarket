package com.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.StockDTO;
import com.model.service.ProductService;
import com.util.MapParamInputer;

@WebServlet("/StockInfoGetterServlet")
public class StockInfoGetterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//셋팅
		PrintWriter out = response.getWriter();

		//propriating
		String pCode = request.getParameter("pCode");
		String source = request.getParameter("source");
		if(source==null)source = "item_text";
		//변수 초기화
		boolean size=false, color=false, price=false, amount=false, deliverfee=false;  	
		switch(source) {
			case "item_text":size=true;color=true;price=true;amount=true;deliverfee=true;break;
			case "item_size":size=true;amount=true;break;
		}
		HashMap<String, String> map 
						= MapParamInputer.set("size",size,"color",color,"price",price,"amount",amount,"deliverfee",deliverfee,"pCode",pCode);
		//with model
		ProductService service = new ProductService();				
		List<StockDTO> stock_list = service.getProduct_info(map);
	
		if(source.equals("item_size")) {
			List<String> temp =  (List<String>)new ArrayList<String>();
			stock_list = stock_list.stream().sorted((o1,o2)->o1.getpSize().compareTo(o2.getpSize())).collect(Collectors.toList());
			for(StockDTO stock :stock_list) {
				temp.add(stock.getpSize()+":"+stock.getpAmount());
			}
			temp = temp.stream().map((atom)->"\""+atom+"\"").collect(Collectors.toList());								
			//print
			out.print(temp);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
