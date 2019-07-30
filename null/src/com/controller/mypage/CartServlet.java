package com.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<td>이름</td>");
		out.println("<td>나이</td>");
		out.println("<td>주소</td>");
		out.println("<tr>");
		out.println("<tr>");
		out.println("<td>홍길동</td>");
		out.println("<td>20</td>");
		out.println("<td>서울</td>");
		out.println("<tr>");
		out.println("</table>");
		out.println("</body></html>");
	}

}
