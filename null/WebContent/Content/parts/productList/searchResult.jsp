<%@page import="org.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<ProductDTO> pList = (List<ProductDTO>)request.getAttribute("pList");
	
	//검색된 리스트 길이
	if(pList!=null){
		request.setAttribute("list_length",  pList.size());
	}else {
		request.setAttribute("list_length",  0);
	}
%>
<c:if test="${!empty searchedWord}">
	<div class="body result">
		<div id="result">
			<span class="result word">"${searchedWord}"</span><span id="string1">검색 결과</span><br>
			 <span class="result quantity">${list_length}</span><span	id="string2">개 상품</span>
		</div>
	</div>
</c:if>





