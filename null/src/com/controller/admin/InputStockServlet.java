package com.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.service.AdminService;


@WebServlet("/InputStockServlet")
public class InputStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain;charset=utf-8");
	
		String pcode = request.getParameter("pcode");
		String pname = request.getParameter("pname");
		System.out.println(pcode);
		PrintWriter out = response.getWriter();
		AdminService service = new AdminService();
		if(pcode==null) {
			pcode = service.searchPcodeByPname(pname);
			if(pcode==null) {
				out.print("pnamenone");
			}else {
				out.print(pcode);
			}
			
		}else if(pname==null) {
			
			pname = service.searchPnameByPcode(pcode);
			if(pname==null) {
				out.print("pcodenone");
			}else {
				out.print(pname);
			}
		}else {
			
			String searchPcode = service.searchPcodeByPname(pname);
			String searchPname = service.searchPnameByPcode(pcode);
			if(searchPcode==null && searchPname==null) {
				out.print("bothnosearch");
			}else if(searchPcode==null) {
				out.print("pnamenosearch");
			}else if(searchPname==null) {
				out.print("pcodenosearch");
			}else {
				if(!pcode.equals(searchPcode)&&!pname.equals(searchPname)) {
					out.print("bothnot");
				}
				else if(!pcode.equals(searchPcode)) {
					out.print("pcodenot");
				}else if(!pname.equals(searchPname)) {
					out.print("pnamenot");
				}else {
					out.print("both");
				}
			}
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pname = request.getParameter("pname");
		String pcode = request.getParameter("pcode");
		String psize = request.getParameter("psize");
		String pcolor = request.getParameter("pcolor");
		String pamount = request.getParameter("pamount");
		String pprice = request.getParameter("pprice");
		String deliverfee_yn = request.getParameter("deliverfee_yn");
		String scode = pcolor+psize+pname;
		System.out.println(pname);
		System.out.println(pcode);
		System.out.println(psize);
		System.out.println(pcolor);
		System.out.println(pamount);
		System.out.println(pprice);
		System.out.println(deliverfee_yn);
		System.out.println(scode);
	}

}
