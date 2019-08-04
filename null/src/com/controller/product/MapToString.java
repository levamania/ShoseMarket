package com.controller.product;

import java.util.Arrays;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.util.MapParamInputer;

public class MapToString {

	private static Logger logger = LoggerFactory.getLogger(MapToString.class);
	
	public static void main(String[] args) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location", MapParamInputer.set("size",250,"amount",8));
		map.put("backword", MapParamInputer.set("size",250,"amount",8));
		map.put("mop", MapParamInputer.set("size",250,"amount",8));
		
		JSONObject json = new JSONObject(map);
		
		logger.debug("mesg {"+json+"}","debug");
	}

}
