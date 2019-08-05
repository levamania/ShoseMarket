package com.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

public class SearchOrderCalDate {
	public static final int TODAY=0;
	public static final int DAYS=1;
	public static final int MONTHS=2;
	public static HashMap<String,String> getDate(String month, int mode) {
		HashMap<String, String> map = new HashMap<String, String>();
		LocalDate currentDate = LocalDate.now();
		currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String start = "";
		String end= currentDate.toString();
		switch (mode) {
		case TODAY:
			start=null;
			break;
		case DAYS:
			start= currentDate.minusDays(15).toString();
			break;
		case MONTHS:
			start = currentDate.minusMonths(Integer.parseInt(month)).toString();
			break;
		default:
			break;
		}
		map.put("start", start);
		map.put("end", end);
		return map;
	}
}
