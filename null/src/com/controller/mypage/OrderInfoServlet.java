package com.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.model.service.MyPageService;
import com.util.SearchOrderCalDate;
import com.util.SessionCheckInterface;


@WebServlet("/OrderInfoServlet")
public class OrderInfoServlet extends HttpServlet implements SessionCheckInterface{
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "orderinfo.jsp";
		HttpSession session = request.getSession();
		
		sessionCheck(session, request, response, url, REDIRECT,()->{
			MyPageService service = new MyPageService();
			MemberDTO login = (MemberDTO)session.getAttribute("login");
			String userid = login.getUserid();
			HashMap<String, String> map = new HashMap<String,String>();
			String day = request.getParameter("day");
			if(day==null ||day.equals("15일")) {
				map= SearchOrderCalDate.getDate("", SearchOrderCalDate.DAYS);
			}else if(day.equals("오늘")) {
				map = SearchOrderCalDate.getDate("", SearchOrderCalDate.TODAY);
			}
			else if((day.equals("1개월")||day.equals("3개월"))){
					map = SearchOrderCalDate.getDate(day.substring(0,1),SearchOrderCalDate.MONTHS);
			}else {
				String[] values = day.split(":");
				map.put("start",values[0]);
				map.put("end",values[1]);
				
			}
			
			map.put("userid", userid);
			List<OrderDTO> list = service.getOrderList(map);
			session.setAttribute("orderlist", list);
<<<<<<< HEAD
			list.stream().forEach(o->System.out.println(o));
			System.out.println(userid);
			
			System.out.println(map.get("start")+map.get("end"));
=======
>>>>>>> refs/heads/tglee
		});
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
