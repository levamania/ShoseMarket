<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link rel="stylesheet" type="text/css" href="/null/Content/admin/css/inputStock.css?ver=2">
</head>
<script src="/null/Content/api/jquery/jquery-3.4.1.js"></script>
<body>
<div><jsp:include page="top.jsp"/></div>
<form action="/null/InputStockServlet" method="post">
<div id="body">
	<div id="body_left"><jsp:include page="left.jsp"/></div>
	<div id="body_content">
		<div>
			<span>상품 정보 입력</span>
		</div>
		<div>
			<div class="product_name">
				<span style="margin-right: 54px">상품명</span>
				<input type="text" size="20" name="pname" id="pname">
			</div>
			<div class="product_name">
				<span>상품코드</span>
				<input type="text" size="10" name="pcode" id="pcode">
			</div>
			<div class="product_name"><input type="button" value="확인" id="checkpcode"> </div>
		</div>
		<div>
			<div  class="product_selector">
				<span>상품사이즈</span>
				<select id="psize" name="psize" style="width: 70px;">
				</select>
			</div>
			<div  class="product_selector">
				<span style="margin-left: 110px;">상품색상</span>
				<select id="pcolor" name="pcolor" >
					<option>WHITE</option>
					<option>RED</option>
					<option>BLUE</option>
					<option>GREEN</option>
					<option>BLACK</option>
				</select>
			</div>		
			<div  class="product_selector">
				<span>개수</span>
				<input type="text" name="pamount" id="pamount" size="10">
			</div>
		</div>
		<div>
			<div class="product_info">
				<span style="margin-right: 38px;">상품가격</span>
				<input type="text" id="pprice" name="pprice">
			</div>
			<div class="product_info">
				<span style="padding-right: 20px; margin-left: 64px;">&nbsp;&nbsp;배송비:</span>
				<input type="radio" name="deliverfee_yn" value="Y" checked="checked"> &nbsp;&nbsp;배송비 포함 
				<input type="radio" name="deliverfee_yn" value="N" style="margin-left: 20px;"> &nbsp;&nbsp;배송비 미포함
			</div>
		</div>
		<div id="submitbtn">
			<input type="submit" value="저장">
		</div>
	</div>
	
</div>
</form>
<script src="/null/Content/admin/js/inputStock.js?ver=1"></script>
</body>
</html>