package com.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.StockJoinProductDTO;
import com.model.service.AdminService;
import com.util.CreatePaging;
import com.util.SearchOrderCalDate;


@WebServlet("/SearchStockServlet")
public class SearchStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pname=&pcode=&pregitdate=&searchDate=2019-08-262019-08-31
		/*
		 * searchStock.jsp에서 post 방식으로 파라미터 전송
		 * pname: 상품명
		 * pcode: 상품코드
		 * searchDate: 등록날짜
		 * styletop: 대분류
		 * stylemid: 중분류
		 * stylebot: 소분류
		 * 
		 * */
		
		HashMap<String, String> map = new HashMap<String, String>();
		AdminService service = new AdminService();
		
		String pname=request.getParameter("pname");
		System.out.println(pname);
		String pcode=request.getParameter("pcode");
		String styletop = request.getParameter("styletop");
		String stylemid = request.getParameter("stylemid");
		String stylebot = request.getParameter("stylebot");
		String searchDate = request.getParameter("searchDate");
		String cursor = request.getParameter("cursor");
		
		//날짜 계산용 mod 오늘 15일 1개월 3개월 1년 구분용
		int mod=99;
		
		//날짜 확인
		if(!searchDate.equals("")) {
			if(searchDate.length()>15) {
				//2019-08-202019-08-28
				String start = searchDate.substring(0, 10);
				String end = searchDate.substring(10);
				map.put("start", start);
				map.put("end", end);
			}else {
				if(searchDate.equals("오늘")) {
					map = SearchOrderCalDate.getDate("",SearchOrderCalDate.TODAY);
				}else if(searchDate.equals("15일")) {
					map = SearchOrderCalDate.getDate("15", SearchOrderCalDate.DAYS);
				}else if(searchDate.equals("1개월")) {
					map = SearchOrderCalDate.getDate("1", SearchOrderCalDate.MONTHS);
				}else if(searchDate.equals("3개월")) {
					map = SearchOrderCalDate.getDate("3", SearchOrderCalDate.MONTHS);
				}else if(searchDate.equals("1년")) {
					map = SearchOrderCalDate.getDate("1", SearchOrderCalDate.YEAR);
				}else if(searchDate.equals("전체일")) {
					map.put("start", null);
					map.put("end", null);
				}
			}
			
		}
		
		//상품명으로 검색
		if(!pname.equals("")) {
			map.put("pname", pname);
			map.put("styletop", null);
			map.put("stylemid", null);
			map.put("stylebot", null);
		//스타일로 검색
		}else {
			map.put("pname", null);
			if(styletop.equals("select")) {
				styletop=null;
			}
			if(stylemid.equals("select")) {
				stylemid=null;
			}
			if(stylebot.equals("select")) {
				stylebot=null;
			}
			map.put("styletop", styletop);
			map.put("stylemid", stylemid);
			map.put("stylebot", stylebot);
			
		}
		int totalRows = service.searchCount(map);
		CreatePaging paging = new CreatePaging(Integer.parseInt(cursor));
		//paging 객체 생성
		paging.setTotalPage(totalRows);
		int searchRow = paging.getSearchRow();
		int rows = paging.getRows();
		System.out.println(paging);
		
		List<StockJoinProductDTO> list = service.searchStock(map,searchRow,rows);
		request.setAttribute("orders", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Content/admin/searchStock.jsp");
		dispatcher.forward(request, response);
		list.stream().forEach(System.out::println);
	}

}
