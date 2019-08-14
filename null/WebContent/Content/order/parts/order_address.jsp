<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" style="text/css" href="/null/Content/order/css/order_address.css">
<script src="/null/Content/order/js/order_address.js"></script>
	
<div class="body" >
	<span>주문 고객 정보</span>
	<div id="customer" class="box">
		<div class="boxer">
			<div class="head"><span>*</span>주문하시는 분</div>
			<div class="context"><input type="text">  <input type="checkbox"> 주문자 변경</div>
		</div>
		<div class="boxer">
			<div class="head"><span>*</span>휴대폰 번호</div>
			<div class="context">
				<select>
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>
				-<input type="text">-<input type="text">
			</div>
		</div>
		<div class="boxer">
			<div class="head"><span>*</span>이메일 주소</div>
			<div class="context"><input type="text">@<input type="text"></div>
		</div>
	</div>

	<span>배송지 정보</span>
	<div id="address" class="box">
		<div class="boxer">
			<div class="head">배송방법</div>
			<div class="context"></div>
		</div>
		<div class="boxer">
			<div class="head"><span>*</span>이름</div>
			<div class="context">
				<input type="text">
				<input type="radio" name="copy"><input type="radio" name="copy"><input type="radio" name="copy">
				<span>내 주소록</span>
			</div>
		</div>
		<div class="boxer">
			<div class="head"><span>*</span>휴대폰 번호</div>
			<div class="context">
				<select>
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>
				-<input type="text">-<input type="text">
			</div>
		</div>
		<div class="boxer">
			<div class="head"><span>*</span>전화 번호</div>
			<div class="context">
				<select>
					<option>02</option>
					<option>031</option>
					<option>032</option>
					<option>051</option>
					<option>041</option>
					<option>042</option>
				</select>
				-<input type="text">-<input type="text">
			</div>
		</div>
		<div class="boxer">
			<div class="head"><span>*</span>주소</div>
			<div class="context"></div>
		</div>
		<div class="boxer">
			<div class="head">배송시 요청사항</div>
			<div class="context"><input type="text"></div>
		</div>
	</div>

	#customer>div.boxer*3>div.head+div.context
</div>