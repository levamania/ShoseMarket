package com.util;

import java.util.HashMap;

public class MapParamInputer  {
	
	public  static <T,Q> HashMap<T,Q> set(Object ...str){
		HashMap<T,Q> map = new HashMap<>();
		for(int i =0; i<str.length; i+=2) {
			try {
			map.put((T)str[i], (Q)str[i+1]);
			} catch(Exception e) {
				map.put((T)str[i], null);
			}
		}
		return map;
	}
}
