package com.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.exception.CustomException;
import com.model.service.ModelService;

public class WordInspector {
	
	private File dictionary;
	
	public WordInspector(File dictionary) {
		this.dictionary = dictionary;
	}
	/**
	 *  입력한 단어를 JSON 형식으로 작성된 파일에 맞추어
	 *  번역한다
	 * 
	 * @param input 번역이 필요한 단어
	 * @return 번역된 맵과 번역되지 않은 맵 두개를 리턴
	 * @throws IOException
	 */
	public  HashMap<String, List<String>>  translate(String input) throws IOException {
		
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
		File dictionary = this.dictionary;
		BufferedReader buff = new BufferedReader(new FileReader(dictionary));
		
		//collection copy
		ArrayList<String>copy = new ArrayList<String>();
		ArrayList<String>forRank = new ArrayList<String>();
		for(String atom: list) {copy.add(atom); forRank.add(atom);}

		String reposit = "";
		while((reposit=buff.readLine())!=null) {
			String[] dic_entry = reposit.split("="); //포맷팅
			String eng = dic_entry[0];
			List<String> kor_list = Arrays.asList(dic_entry[1].split(","));
			//copy list iterating
			for(String word:copy) {	
				for(String kor:kor_list) {
					if(word.equals(kor)) {
						list.remove(word); list.add(eng);
						forRank.remove(word); 
						forRank.add(kor_list.get(0)); //완성된 단어로 변경						
					}
				}
			}
		}//end translating
		buff.close();
		//lists 저장, copy = 랭킹 저장용 | list = 검색용	
		return MapParamInputer.set("searching", list, "ranking", forRank);
	}//end method

	
	public HashMap<String,Object> auto_categorize(ModelService service, List<String> word_list, List<String> tables ){
		HashMap<String, Object> harry = new HashMap<String, Object>();
		Set<String> categories = service.getKeyset(MapParamInputer.set("TABLES",tables));
		for(String key: categories) {
			List<String> single = service.getCategory(MapParamInputer.set("TEMP",key));
			List<String> lone = new ArrayList<String>();
			for(String atom : single) {
				for(String word : word_list) {
					if(atom.contains(word))lone.add(word);
				}
			}
			harry.put(key, (lone.size()!=0)?lone:null );
		}
		return harry;
	}
}//end class
