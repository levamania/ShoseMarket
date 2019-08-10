package com.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Test {
	public static void main(String[] args) throws JsonParseException, JsonMappingException, IOException {
		File file = new File("C:/NullMart/server/config.json");
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = mapper.readValue(file, HashMap.class);
		System.out.println(map.get("deploy_path"));
	}
}
