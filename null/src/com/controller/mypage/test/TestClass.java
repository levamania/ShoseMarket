package com.controller.mypage.test;

import java.util.HashMap;

import com.util.SearchOrderCalDate;

public class TestClass {
	public static void main(String[] args) {
		HashMap<String, String> map = SearchOrderCalDate.getDate("", SearchOrderCalDate.DAYS);
		System.out.println(map.get("start"));
		System.out.println(map.get("end"));
		
		map = SearchOrderCalDate.getDate("3", SearchOrderCalDate.MONTHS);
		System.out.println(map.get("start"));
		System.out.println(map.get("end"));
	}
}
