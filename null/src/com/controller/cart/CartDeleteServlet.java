package com.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.model.service.CartService;
import com.util.LoginIndicator;


@WebServlet("/CartDeleteServlet")
public class CartDeleteServlet extends HttpServlet {
	
	Logger logger = LoggerFactory.getLogger(CartDeleteServlet.class);
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//setting
		PrintWriter out = response.getWriter();
		//수용
		String userid = LoginIndicator.check(request, response);
		String temp = request.getParameter("cno_list");
		logger.debug("mesg{카트:"+temp+"}");
		
		JSONParser parser = new JSONParser();
		JSONArray json = null;
		try {
			json = (JSONArray)parser.parse(temp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		logger.debug("mesg{카트 넘버리스트:"+json+"}");
		
		List<Object> list = Arrays.asList(json.toArray());
		
		//with model
		CartService ser = new CartService();
		int result = ser.deleteCart(list);
		
		if(result==list.size()) {
			out.print("success");
		}else{
			out.print("fail");
		}
		
		
		
		//with jsp
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	 
		doGet(request, response);
	}

}
