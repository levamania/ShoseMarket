<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/null/Content/product_list/css/searchingOption.css"  type="text/css"> 
<!-- <script src="/null/Content/product_list/js/searchingOption.js"></script> -->
<jsp:include page="/Content/product_list/js/searchingOption.jsp" flush="true"/>
<c:if test="${!empty pList}">
<div class="body searching_option">
	<div class="category_option" id="styletop">
		<div class="head">테마</div>
		<div class="value">
			<c:forEach var="THEME" items="${STYLETOP}">
				<div class="button">${THEME}</div>
			</c:forEach>
		</div>
	</div>
	<div class="category_option" id="pprice">
		<div class="head">가격</div>
		<div class="value">
			<div><input type="text" id="min_price">&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;~ </div>
			 <div><input type="text" id="max_price">&nbsp;원</div>
		</div>
	</div>
	<div class="category_option" id="stylemid">
		<div class="head">카테고리</div>
		<div class="value">
			<c:forEach var="STYLE" items="${STYLEMID}">
				<div class="button">${STYLE}</div><div></div>
			</c:forEach>
		<!-- AJAX 처리 -->
		<div class="deeper"></div>
		</div>
	</div>
	<div class="category_option" id="psize">
		<div class="head">사이즈</div>
		<div class="value">
			<c:forEach var="SIZE" items="${PSIZE}">
				<div class="button">${SIZE}</div>
			</c:forEach>
		</div>
	</div>
	<div class="category_option" id="pcolor">
		<div class="head">색상</div>
		<div class="value">
			<c:forEach var="COLOR" items="${PCOLOR}">
				<div class="button">${COLOR}</div>
			</c:forEach>
		</div>
	</div>
	<div class="category_option" id="collection">
		<div class="head">선택한 조건</div>
		<div class="value"></div>
		<div id="purge">전체해제</div>
	</div>
	<div id="find">
	</div>
</div>
</c:if>