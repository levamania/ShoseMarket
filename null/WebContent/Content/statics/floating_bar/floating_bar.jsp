<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/null/Content/statics/floating_bar/js/floating_bar.js"></script>
<link rel="stylesheet" type="text/css" href="/null/Content/statics/floating_bar/css/floating_bar.css">
<div id="floating_bar">
	<div id="head">
		<div>최근 본 상품</div>
	</div>
	<div id="body">
	<c:forEach var="ITEM" items="${LIFO_COOKIES}" >
		<div>
			<img src="/null/Content/img/${ITEM.STYEMID}/${ITEM.STYEBOT}/${ITEM.PIMAGE}.jpg">
			<div class="noun">${ITEM.PNAME}</div>
			<span>${ITEM.PCODE}</span>	
		</div>
	</c:forEach>
	
	<div>
		<img src="/null/Content/img/main/rabbit.jpg">
		<div class="noun">rabbit</div>
	</div>
	<div>d</div>
	<div>d</div>
	<div>d</div>
	</div>
	<div id="tail">
		<div>top</div>
	</div>
</div>