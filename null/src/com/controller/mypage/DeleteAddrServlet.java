package com.controller.mypage;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.service.MyPageService;


@WebServlet("/DeleteAddrServlet")
public class DeleteAddrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("delivnos"));
		String[] strDelivnos = request.getParameter("delivnos").split("-");
		System.out.println(strDelivnos.length);
		List<String> delivnos = Arrays.asList(strDelivnos);
		MyPageService service = new MyPageService();
		service.deleteDelivnos(delivnos);
		response.sendRedirect("/null/AddrListServlet");
		
	}

}
