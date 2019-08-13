<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지</title>
<link rel="stylesheet" type="text/css" href="/null/Content/admin/css/searchStock.css?ver=3" >
<link rel="stylesheet" href="/null/Content/api/jquery/jquery-ui/jquery-ui.css">
</head>
<script src="/null/Content/api/jquery/jquery-3.4.1.js"></script>
<script src="/null/Content/api/jquery/jquery-ui/jquery-ui.js"></script>
<body>
<header>
	<jsp:include page="top.jsp"/>
</header>
<form action="/null/SearchStockServlet" method="get">
<div id="container">
	<nav>
		<jsp:include page="left.jsp"/>
	</nav>
	<section>
		<div>
			상품 검색하기
		</div>
		<div id="input_pname">
			<div>상품명<input id="pname" name="pname"></div>
			<div>상품코드<input type="text" disabled="disabled"></div>
			<div><input type="submit" value="조회"></div>
		</div>
		<div id="selections">
			<div>대분류<input type="text" id="styletop" name="styletop" disabled="disabled">
			</div>
			<div>중분류<input type="text" id="stylemid" name="stylemid" disabled="disabled">
			</div>
			<div>소분류<input type="text" id="stylebot" name="stylebot" disabled="disabled">
			</div>
		</div>
		<div id="order_search">
			<div>
				<button type="button" class="dateValue">오늘</button>
				<button type="button" class="dateValue">15일</button>
				<button type="button" class="dateValue">1개월</button>
				<button type="button" class="dateValue">3개월</button>
				<button type="button" class="dateValue">1년</button>
				<button type="button" class="dateValue">전체</button>
			</div>
			<div>
				<input type="date" id="date1" >~
				<input type="date" id="date2" >
				<input type="hidden" id="searchDate" name="searchDate" value="">
			</div>
		</div>
	</section>
</div>


<%-- <div id="body">
	<div id="body_left"><jsp:include page="left.jsp"/></div>
	<div id="body_content">
		<div>
			<span>상품 검색하기</span>
		</div>
		<div>
			<table>
				<tr>
					<td>상품명</td>
					<td><input id="pname" name="pname"></td>
					<td>상품코드</td>
					<td><input type="text" disabled="disabled"></td>
					<td colspan="2"><input type="submit" value="조회"></td>
				</tr>
				<tr>
					<td>대분류</td>
					<td>
						<select id="styletop">
							
						</select>
					</td>
					<td>중분류</td>
					<td>
						<select id="stylemid">
							
						</select>
					</td>
					<td>소분류</td>
					<td>
						<select id="stylebot">
							
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="6">
						<div id="order_search">
							<button type="button" class="dateValue">오늘</button>
							<button type="button" class="dateValue">15일</button>
							<button type="button" class="dateValue">1개월</button>
							<button type="button" class="dateValue">3개월</button>
							<button type="button" class="dateValue">1년</button>
							<button type="button" class="dateValue">전체</button>
							<input type="date" id="date1" >~
							<input type="date" id="date2" >
							<input type="hidden" id="searchDate" name="searchDate" value="">
						</div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="6"><div style="border-top: 1px solid red;"></div></td>
				</tr>
				<tr>
					<th>scode</th>
					<th>pcode</th>
					<th>상품명</th>
					<th>가격</th>
					<th>재고</th>
					<th>등록일</th>
				</tr>
				<tr>
					<td colspan="6"><div style="border-bottom: 1px solid red;"></div></td>
				</tr>
			</table>
		</div>

	</div>
	
</div> --%>
</form>
<script src="/null/Content/admin/js/searchStock.js?ver=1"></script>
</body>
</html>