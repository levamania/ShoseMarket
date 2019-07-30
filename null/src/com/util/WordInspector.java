package com.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.exception.CustomException;

public class WordInspector {
	public static Map<String, ArrayList<String>>  inspect(String input) throws IOException {
		
		//word_inspecting -- excepting special literal
		Pattern pattern = Pattern.compile("[가-힣A-Za-z]{1,10}");
		Matcher matcher = pattern.matcher(input);
		
		ArrayList<String> list = null; //1차 유효성 검사에서 살아남은 아이들
		
		while(matcher.find()) {
			String word = input.substring(matcher.start(), matcher.end());
			if(word.length()!=0) {
				if(list==null)list = new ArrayList<String>();
				list.add(word);
			}
		}
		
		if(list==null)throw new CustomException("검색가능 단어 없음");
			
		//file loading
		File dictionary = 
				new File("C:/ShoseMarket/null/WebContent/Content/configuration/subsitution_dictionary.txt");
		BufferedReader buff = new BufferedReader(new FileReader(dictionary));
		
		//collection copy
		ArrayList<String>copy = new ArrayList<String>();
		for(String atom: list) {copy.add(atom);}
		
		String reposit = "";
		while((reposit=buff.readLine())!=null) {
			String[] dic_entry = reposit.split("="); //포맷팅
			String eng = dic_entry[0]; String kor = dic_entry[1];
			//copy list iterating
			for(String word:copy) {
				if(word.equals(kor)) {
					list.remove(word); //국문단어 삭제
					list.add(eng);	//영단어로 치환
				}
			}
		}
		//lists 저장, copy = 랭킹 저장용 | list = 검색용	
		return MapParamInputer.set("searching", list, "ranking", copy);
	}//end method

}//end class
