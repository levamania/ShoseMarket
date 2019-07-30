<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문현황 조회</title>
<style type="text/css">
	#top_box{
		display: inline-block;
		vertical-align: top;
	}
	#order_search{
		height:30px; 
		width:850px; 
		background-color: #F6F6F6;
		padding-top: 10px;
		padding-bottom: 10px;
	}
</style>
</head>
<body>
<script src="jquery-3.4.1.js"></script>
<jsp:include page="top.jsp"></jsp:include>
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

<script src="js/orderinfo.js"></script>
</body>
</html>