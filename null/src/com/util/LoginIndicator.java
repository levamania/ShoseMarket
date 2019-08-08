package com.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.exception.CustomException;

public class LoginIndicator {
	public static String check(HttpServletRequest request, HttpServletResponse response){
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
				response.sendRedirect("/null/error/login_error.jsp");
				System.out.println("리다이렉트 작동");
			} catch (IOException e) {
				e.printStackTrace();			
			}
			return null;
		}
	}
}
