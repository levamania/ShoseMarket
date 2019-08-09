<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="stylesheet" type="text/css" href="/null/Content/admin/css/searchStock.css?ver=2">
</head>
<script src="/null/Content/api/jquery/jquery-3.4.1.js"></script>
<script src="/null/Content/admin/js/util.js"></script>
<body>
<div><jsp:include page="top.jsp"/></div>
<form action="/null/InputStockServlet" method="post">
<div id="body">
	<div id="body_left"><jsp:include page="left.jsp"/></div>
	<div id="body_content">
		<div>
			<span>상품 검색하기</span>
		</div>
		<div>
			<table>
				<tr>
					<td>상품명</td>
					<td><input type="text"></td>
					<td>상품코드</td>
					<td><input type="text"></td>
					<td colspan="2"><input type="button" value="조회"></td>
				</tr>
				<tr>
					<td>대분류</td>
					<td>
						<select id="styletop">
							<option>both</option>
							<option>male</option>
							<option>female</option>
						</select>
					</td>
					<td>중분류</td>
					<td>
						<select id="stylemid">
							<option>sports</option>
							<option>tennis</option>
							<option>shoe</option>
							<option>boots</option>
						</select>
					</td>
					<td>소분류</td>
					<td>
						<select id="stylebot">
							
						</select>
					</td>
				</tr>
			</table>
		</div>

	</div>
	
</div>
</form>
<script src="/null/Content/admin/js/searchStock.js"></script>
</body>
</html>