package com.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.exception.CustomException;

public class LoginIndicator {
	public static String check(HttpServletRequest request, HttpServletResponse response) throws CustomException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		if(member!=null) {
			return member.getUserid();
		}else {
			throw new CustomException("invalid_login");
		}
	}
}

