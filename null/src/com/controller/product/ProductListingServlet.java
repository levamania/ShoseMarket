package com.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ProductDTO;
import com.exception.CustomException;
import com.model.service.ProductService;
import com.model.service.RankingService;
import com.util.MapParamInputer;
import com.util.WordInspector;

@WebServlet("/ProductListingServlet")
public class ProductListingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchedWord = request.getParameter("searchedWord");
		String source = request.getParameter("source");
		if(source==null)source="other"; 
		
		//setting
		RequestDispatcher dis = null;
		Map<String, ArrayList<String>> words_map = null;
		List<ProductDTO> pList = null;
		
		try {
			words_map = WordInspector.inspect(searchedWord);
	
			//data for comparison
			ProductService service = new ProductService();
			List<String> stylemid = service.getProducts_info(MapParamInputer.set("style","styleMid"));
			List<String> stylebot = service.getProducts_info(MapParamInputer.set("style","styleBot"));
			List<String> pname = service.getProducts_info(MapParamInputer.set("pName","pName"));			
			//repository of category or name
			HashMap<String,String> reposit = new HashMap<String, String>(); 
			//comparing to figure out category
			for(String word: words_map.get("searching")) {
				for(String mid: stylemid) {if(mid.contains(word))reposit.put("styleMid",word);}
				for(String bot: stylebot)  {if(bot.contains(word))reposit.put("styleBot",word);}
				for(String name: pname) {	if(name.contains(word))reposit.put("pName",word);}
			}
			System.out.println(reposit);
		
			//list searching through category
			if(reposit.keySet().size()!=0) {
				pList =  service.selectProductList(reposit);
				//inserting keyword to ranking
				if(!source.equals("main")) {
					RankingService ser = new RankingService();
					for(String word: words_map.get("ranking")) {
						if(ser.updateRanking(word)==0)ser.insertRanking(word); 
					}
				}//end_rank
			}// end_ser
		
		} catch (CustomException e) {
			e.getMessage();
		} catch(IOException e){
			System.out.println("경고: 파일이 없데요!");
		} catch (Exception e) {
			System.out.println("너 또 왜!");
		}
		//with jsp
		dis = request.getRequestDispatcher("/Content/product_list/productList.jsp");
			//statcking 
			if(!source.equals("main")) {
				request.setAttribute("searchedWord", searchedWord);
			}
			request.setAttribute("pList", pList);
			//shooting
			dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
