package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dto.ProductDTO;

public class ComparatorGenerator {

	private static Logger logger;
	private int reversal = 0;
	
	public  Comparator<ProductDTO> generate(String order_criteria, String direction){
		//로그 셋팅
		logger = LoggerFactory.getLogger(ComparatorGenerator.class);
		//정렬 기준 가공
		String temp =  direction.toLowerCase();
		switch(temp) {
			case "asc": this.reversal=1;break;
			case "desc": this.reversal=-1;break;
		}
		logger.debug("mesg{reversal: "+reversal+"}", "debug");
		Comparator<ProductDTO> comparator = null;
		
		switch(order_criteria) {
		case "date": comparator = (p1,p2)->{
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
			int result = 0;
			try {
				Date date1 = sdf.parse(p1.getpRegitDate());
				Date date2 = sdf.parse(p2.getpRegitDate());
				result = date1.compareTo(date2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return result*reversal;
			};break;
		case "popularity": comparator = (p1,p2)->Integer.compare(p1.getPopularity(),p2.getPopularity())*reversal; break;
		case "price": 	comparator = (p1,p2)-> Integer.compare(p1.getpPrice(),p2.getpPrice())*reversal; break;

	}
		return comparator;
	}
}
