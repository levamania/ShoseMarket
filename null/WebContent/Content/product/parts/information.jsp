<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="/null/Content/product/css/information.css">
<form action="" method="post" onsubmit="return false">
<div class="body" id="product_info">
	<div id="product_img">
		<img
			src="/null/Content/img/shoes/${product.styleMid}/${product.styleBot}/${product.pImage}.jpg">
	</div>
	<div id="option">
		<div class="title">
			<span style="font-size: 32px; font-weight: bolder; font-family: Maplestroy";>
				${product.pCode} ${product.pName} 
			</span> 
			<span style="font-size: 12px; color: gray;">스타일 코드: ${scode[0]}</span>
		</div>
		<div class="content">
			<div>판매가</div>
			<div>${min_price}</div>
		</div>
		<div class="content">
			<div>배송비</div>
			<div>${(deliverfee_yn[0]=='Y')?'2,500원':'무료 배송'}</div>
		</div>
		<div class="content">
			<div>색상</div>
			<div id="colors">
				<c:forEach var="item" items="${pcolor}">
					<div class="color" style="background-color:${item}"></div>
				</c:forEach>
			</div>
		</div>
		<div class="content" >
			<div>사이즈</div>
			<div id="sizes">
				<c:forEach var="item" items="${psize}">
					<div class="size">${item}</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="payment">
		<div id="total">총 결제 금액&nbsp;<span id="total_price" style="color:red;font-size:25px;">0</span>&nbsp;원</div>
		<div>찜하기</div>
		<div>장바구니</div>
		<div>바로구매</div>
	</div>
	<div class="content	 reposit">
		<div style="flex:30"></div>
		<div style="flex:25; text-align: center"></div>
		<div style="flex:30"><div></div></div>
		<div style="flex:10"></div>
	</div>
</div>
</form>