<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>주문현황 조회</title>
<link rel="stylesheet" href="/null/Content/mypage/css/orderinfo.css">
</head>
<body>
<script src="/null/Content/api/jquery/jquery-3.4.1.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div id="body">
<div id="top_box" >
	<p style="font-weight:bolder; font-size: 20px;">주문현황 조회</p>
	<div id="order_search">쇼핑몰 구매 내력
		<button type="button" class="dateValue">오늘</button>
		<button type="button" class="dateValue">15일</button>
		<button type="button" class="dateValue">1개월</button>
		<button type="button" class="dateValue">3개월</button>
		<input type="date" id="date1" class="datepicker">~
		<input type="date" id="date2" class="datepicker">
		<input type="hidden" id="searchDate" value="">
		<button type="button" id="searchBtn">조회</button>
	</div>
</div>
<div id="order_top">
	<div class="order_top_content">주문번호</div>
	<div class="order_top_content">주문내용</div>
	<div class="order_top_content">결제금액</div>
	<div class="order_top_content">주문날짜</div>
</div>
<div id="order_list">
	<div class="order_list_content">주문번호</div>
	<div class="order_list_content">주문내용</div>
	<div class="order_list_content">결제금액</div>
	<div class="order_list_content">주문날짜</div>
</div>
</div>
<script src="/null/Content/mypage/js/orderinfo.js"></script>
</body>
</html>