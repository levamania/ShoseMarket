package com.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.RegAddrDTO;
import com.model.service.MyPageService;



@WebServlet("/AddrListServlet")
public class AddrListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = "asd123";
		MyPageService service = new MyPageService();
		List<RegAddrDTO> regAddrDTOs = service.getAddrList(userid);
		HttpSession session = request.getSession();
		session.setAttribute("addrList", regAddrDTOs);
		response.sendRedirect("Content/mypage/addrlist.jsp");
	}

}
