package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.service.ProductService;

@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//with model
		ProductService service = new ProductService();
		//with jsp
		RequestDispatcher dis = request.getRequestDispatcher("/Content/main/main.jsp");
			//stacking data
			//shooting data
			dis.forward(request, response);
					
	}

}
