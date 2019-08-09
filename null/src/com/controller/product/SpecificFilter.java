package com.controller.product;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/SpecificFilter")
public class SpecificFilter extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selected_atoms = request.getParameter("selected_atoms");
					
		//검색단어 가공 - json 파싱
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> listing_setup = mapper.readValue(selected_atoms, HashMap.class);

		//이전 스택
		HttpSession session = request.getSession();
		HashMap<String, Object> prev_stack = (HashMap<String,Object>)session.getAttribute("prev_stack");
			//갈무리된 검색 조건
		prev_stack.remove("listing_setup"); //기존 셋업 삭제(왜? 우리는 검열된 단어가 아닌 전달받은 단어로 다시 셋팅할꺼니까)
		prev_stack.put("listing_setup", listing_setup);//셋팅 재설정 완료
		
		//디스패치
		RequestDispatcher dis = request.getRequestDispatcher("/ProductListingServlet");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
