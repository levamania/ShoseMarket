package com.controller.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.MemberDTO;
import com.model.service.MyPageService;

/**
 * Servlet implementation class ModifyAccountInfo
 */
@WebServlet("/ModifyAccountInfo")
public class ModifyAccountInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Logger logger = LoggerFactory.getLogger(ModifyAccountInfo.class);
		String userid = request.getParameter("userid");
		MyPageService service = new MyPageService();
		MemberDTO member  = service.searchMemberById(userid);
		request.setAttribute("member", member);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Content/mypage/modifyaccountinfo.jsp");
		dispatcher.forward(request, response);
	}

}
