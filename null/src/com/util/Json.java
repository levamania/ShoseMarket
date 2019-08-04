package com.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;

public class Json {
	public static void main(String[] args) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		list.add(MapParamInputer.set("size",250,"price",120));
		map.put("RED", list);
		JSONObject json = new JSONObject(map);
		System.out.println(json);
	}
}
