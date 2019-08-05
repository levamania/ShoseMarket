package com.controller.product;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
import com.exception.CustomException;
import com.model.service.ProductService;
import com.model.service.RankingService;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.CompareGenerator;
import com.util.ComparatorGenerator;
import com.util.MapParamInputer;
import com.util.WordInspector;

import ch.qos.logback.core.subst.Tokenizer;

@WebServlet("/ProductListingServlet2")
public class ProductListingServlet3 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 처리
		HttpSession session = request.getSession();
		HashMap<String, Object> prev_stack = 
				(HashMap<String,Object>)session.getAttribute("prev_stack");
			//info from 현재 페이지 정보
		HashMap<String, Object> listing_setup = null;
		String back_word = "default";
		
		if(prev_stack!=null) {
			back_word = (String)prev_stack.get("back_word");
			listing_setup = (HashMap<String, Object>)prev_stack.get("listing_setup");
			session.removeAttribute("prev_stack");
		}
			//매 페이지 마다 갱신
		session.removeAttribute("prev_stack");
				
		//쿼리 스트링 수용
		String searchedWord = request.getParameter("searchedWord");
		if(searchedWord==null)searchedWord="default";
		String source = request.getParameter("source");
		if(source==null)source="other"; 
		String ordering_info = request.getParameter("ordering_info");
		if(ordering_info==null)ordering_info="date_desc";
		
			//페이징 정보
		String p_temp1 = request.getParameter("cur_page");
		String p_temp2 = request.getParameter("paging_quantity");
		if(p_temp1==null)p_temp1="1";
		if(p_temp2==null)p_temp2="20";
		int cur_page = Integer.parseInt(p_temp1);
		int paging_quantity = Integer.parseInt(p_temp2);
		
		//setting
		RequestDispatcher dis = null;
		Map<String, ArrayList<String>> words_map = null;
		List<ProductDTO> pList = null;
		
		HashMap<String,Object> reposit = null;	
		try {
			ProductService service = new ProductService();
			
			if(!back_word.equals(searchedWord)) {
				//검증되고 번역된 단어얻기
				words_map = WordInspector.inspect(searchedWord);
				//repository of category or name
				reposit = new HashMap<String, Object>(); 
				//data for comparison
				List<String> stylemid = service.getProducts_info(MapParamInputer.set("style","styleMid"));
				List<String> stylebot = service.getProducts_info(MapParamInputer.set("style","styleBot"));
				List<String> pname = service.getProducts_info(MapParamInputer.set("pName","pName"));			
				//comparing to figure out category
				List<String> styleMid = (List<String>)new ArrayList<String>();
				List<String> styleBot = (List<String>)new ArrayList<String>();
				List<String> pName = (List<String>)new ArrayList<String>();
				
				for(String word: words_map.get("searching")) {
					for(String mid: stylemid) {if(mid.contains(word))styleMid.add(word);}
					for(String bot: stylebot) {if(bot.contains(word))styleBot.add(word);	}
					for(String name: pname) {	if(name.contains(word))pName.add(word);}
				}
				reposit.put("styleMid",(styleMid.size()!=0)?styleMid:null);
				reposit.put("styleBot",(styleBot.size()!=0)?styleBot:null);
				reposit.put("pName",(pName.size()!=0)?pName:null);
			
			}else {
				reposit = listing_setup;
			}
	
			//list searching through category
			boolean empty_locator = false;
			for(Object obj  :reposit.values()) {
				if(obj!=null)empty_locator = true;
			}
			
			if(empty_locator) { //유효한 검색어가 없을시동작안함
				List<ProductDTO> raw_list = service.selectProductList(reposit);
				List<ProductDTO> temp = (List<ProductDTO>)new ArrayList<ProductDTO>(); 
				String prev_pcode = "inital";
				//중복 제거
				for(ProductDTO product : raw_list) {
					String curr_pcode = product.getpCode();
					if(!prev_pcode.equals(curr_pcode)) {
						prev_pcode = curr_pcode;
						temp.add(product);
					}
				}
				
				//정렬 기준 선택
				ComparatorGenerator generator = new ComparatorGenerator();
				String order_criteria = ordering_info.split("_")[0];
				String direction = ordering_info.split("_")[1];
				Comparator<ProductDTO> comparator = generator.generate(order_criteria, direction);
				
				//페이징 처리
				pList = temp.stream().sorted(comparator) //정렬
						   .skip((cur_page-1)*paging_quantity).limit(paging_quantity).collect(Collectors.toList()); //페이징->리스트
				//페이지 갯수 저장
				request.setAttribute("page_size", Math.round((temp.size()/paging_quantity)+1));
				request.setAttribute("items_size", temp.size());

				//inserting keyword to ranking
				if(source.equals("input")) {
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
			e.printStackTrace();
		}
		//with jsp
		dis = request.getRequestDispatcher("/Content/product_list/productList.jsp");
			//statcking 
				//세션 처리용
			session.setAttribute("prev_stack", 
					MapParamInputer.setOb("listing_setup", (reposit==listing_setup)?listing_setup:reposit ,"back_word",searchedWord)  );
				//화면 구현용
			request.setAttribute("searchedWord", searchedWord);
			request.setAttribute("source", source);
				
			request.setAttribute("pList", pList);
			request.setAttribute("cur_page", cur_page);
			request.setAttribute("paging_quantity", paging_quantity);
			
			request.setAttribute("ordering_info", ordering_info);
			//shooting
			dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
