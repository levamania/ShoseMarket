package com.controller.product;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.ProductDTO;
import com.dto.StockDTO;
import com.model.service.ProductService;
import com.util.ComparatorGenerator;
import com.util.MapParamInputer;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private Logger logger = LoggerFactory.getLogger(ProductServlet.class);
	private String key;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//셋팅
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		//propriating
		String min_price = request.getParameter("min_price");
		String source = request.getParameter("source");
		if(source==null)source = "item_text";
		String pCode = request.getParameter("pCode");
		String pSize = request.getParameter("pSize");
		String pColor = request.getParameter("pColor");
				
		HashMap<String, Object> reposit = MapParamInputer.set("pCode",pCode,"pSize",pSize,"pColor",pColor);
		if(pColor!=null)reposit.put("pColor", pColor);
		//with model
		ProductService service = new ProductService();				
		List<HashMap<String, Object>> stock_list = service.getProduct_info(reposit);
	
		
		
		if(source.equals("item_size")) {
			List<String> temp =  (List<String>)new ArrayList<String>();
			logger.debug("mesg: stock_list"+stock_list+"","debug");
			stock_list = stock_list.stream().
							  sorted((o1,o2)->o1.get("PSIZE").toString().compareTo(o2.get("PSIZE").toString())).collect(Collectors.toList());
			for(HashMap<String, Object> stock :stock_list) {
				temp.add(stock.get("PSIZE")+":"+((Integer.parseInt(stock.get("PAMOUNT").toString())!=0)?"O":"X" ));
			}
			
			temp = temp.stream().map((atom)->"\""+atom+"\"").collect(Collectors.toList());								
			//print
			out.print(temp);
		}else if(source.equals("item_text")){
			//정렬된 컬럼 리스트 
			Set<String> column_set =  stock_list.get(0).keySet();
			for(String temp_key: column_set) {
				this.key = temp_key;
				List<Object> temp_list = stock_list.stream().map(m->m.get(this.key)).distinct()
													   .sorted((o1,o2)->o1.toString().compareTo(o2.toString())).collect(Collectors.toList());
				String key = temp_key.toString().toLowerCase();
				logger.debug("mesg: key"+key,"debug");
				request.setAttribute(key, temp_list);
			}
			//해당 상품
			ProductDTO product = service.selectProduct(reposit);
			RequestDispatcher dis = request.getRequestDispatcher("/Content/product/product.jsp");
				//정보저장
				request.setAttribute("product", product);
				request.setAttribute("min_price", min_price);
				//사출
				dis.forward(request, response);
				//하나의 프로덕트 디티오, 해당 피코드를 가지고 있는 정렬된 사이즈, 색상, 가격
		}else if(source.equals("item_selection")) {
			String price = stock_list.get(0).get("PPRICE").toString();
			out.print(price);	
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
