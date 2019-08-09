package com.contoller.account;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ManagerDTO;
import com.dto.MemberDTO;
import com.model.dao.ManagerDAO;
import com.model.service.ManagerService;
import com.model.service.MemberService;

@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("masteruserid");
		//언젠간 고치는걸로
		if(userid==null) {
			response.sendRedirect("/null/Content/account/loginForm.jsp");
			
		}else {
			
		String passwd = request.getParameter("masterpasswd");
		System.out.println(userid+passwd);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("masteruserid", userid);
		map.put("masterpasswd", passwd);
		ManagerService service =  new ManagerService();
		ManagerDTO dto = service.masterLogin(map);

	
		
		
		String nextPage = null;
		if (dto == null) {
			nextPage = "LoginUIServlet";

		} else {
			nextPage = "/null/Content/admin/InputStock.jsp";
			
			  HttpSession session = request.getSession(); session.setAttribute("masterLogin", dto);
			  session.setMaxInactiveInterval(60);
			 
		}

		response.sendRedirect(nextPage);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
