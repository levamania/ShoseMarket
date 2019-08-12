<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" style="text/css"	href="/null/Content/cart/css/cart_body.css">
<div class="body cart">
	<div class="container" id="cart_logo">
		<div class="content">
			<div>장바구니</div>
		</div>
		<div class="content">
			<div class="phase">
				<div class="img"><img src="/null/Content/img/cart/basket.png"></div>
				<div class="text">01</div>
				<div class="text">장바구니</div>
			</div>
			<div class="phase">
				<div class="img"></div>
				<div class="text">02</div>
				<div class="text">주문서작성/결제</div>
			</div>
			<div class="phase">
				<div class="img"></div>
				<div class="text">03</div>
				<div class="text">결제완료</div>
			</div>
			<div class="phase">
				<div class="img"></div>
			</div>
			<div id="line"></div>
		</div>
	</div>
	<div class="container" id="cart_list">
		<div class="content">
			<div><input type="checkbox"></div>
			<div>상품명/옵션</div>
			<div>판매가</div>
			<div>수량</div>
			<div>주문금액</div>
			<div>선택</div>
		</div>
		<c:forEach var="ITEM"	 items="${CART_LIST}" >
			<div class="content">
			<div><input type="checkbox"></div>
			<div class="item">
				<span>${ITEM.PCODE}. ${ITEM.PNAME}</span><br>
				<span>${ITEM.PNAME}/${ITEM.PSIZE}/${ITEM.PCOLOR}</span>
				<span class="option"></span>				
			</div>
			<div class="cell">${ITEM.PPRICE}</div>
			<div class="count">
				<div>
					<input value="${ITEM.PAMOUNT}">
					<div>+</div>
					<div>-</div>
				</div>
				<div>변경</div>
			</div>
			<div class="decart">${ITEM.PPRICE}</div>
			<div class="decision">
				<div>바로구매</div>
				<div>삭제</div>
			</div>
			</div>
		</c:forEach>
		<div class="content">
			<div><input type="checkbox"></div>
			<div>선택상품 삭제</div>
		</div>
	</div>
	<div class="container" id="cart_total">
		<div class="content">
			<div>
				<div>주문금액</div>
				<div></div>
				<div></div>
			</div>
			<div>
				<div>배송비</div>
				<div>2,500원</div>
				<div></div>
			</div>
			<div>
				<div>결정예정금액</div>
				<div></div>	
			</div>
		</div>
		<div class="content">
			<div>계속 쇼핑하기</div>
			<div>선택상품 주문하기</div>
			<div>전체상품 주문하기</div>
		</div>
	</div>
</div>