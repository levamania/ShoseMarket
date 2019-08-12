package com.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.exception.CustomException;

public class LoginIndicator {
	public static String check(HttpServletRequest request, HttpServletResponse response) throws CustomException{
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60);
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		if(member!=null) {
			return member.getUserid();
		}else {
			try {
				PrintWriter out = response.getWriter();
				out.print("invaild_login");
				session.setAttribute("warnning", "로그인이 필요합니다.");
				response.sendRedirect("/null/LoginUIServlet");
			} catch (IOException e) {
				e.printStackTrace();			
			}
			throw new CustomException("로그인 필요");
		}	
	}
}

