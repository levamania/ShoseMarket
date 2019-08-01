<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/null/Content/product/css/information.css">
<div class="body" id="product_info">
	<div id="main_container">
		<div id="product_img">
			<img src="/null/Content/img/shoes/${product.styleMid}/${product.styleBot}/${product.pImage}.jpg">
		</div>
		<div id="product_info">
			<div class="title">
				&nbsp;&nbsp;&nbsp;
				<span style="font-size: 32px; font-weight: bolder ; font-family: Maplestroy">
				${product.pCode} ${product.pName}</span>
				<span style="font-size: 12px; color: gray;">스타일 코드: ${scode[0]}</span>
			</div>
			<div class="spec">
				<div>
					<div class="head">
						<div>판매가</div>
					</div> 
					<div class="content">
						<div>${min_price}</div>
					</div>
				</div>
				<div>
					<div class="head"><div>배송비</div></div> 
					<div class="content">
						<div>${(deliverfee_yn[0]=='Y')?'2,500원':'무료 배송'}</div>
					</div>
				</div>
				<div>
					<div class="head"><div> 색상</div></div> 
					<div id="colors" class="content">
						<c:forEach var="item" items="${pcolor}">
							<div style="background-color:${item}"></div>
						</c:forEach> 
					</div>
				</div>
				<div>
					<div class="head"><div>사이즈</div></div> 
					<div class="content" id="sizes">
						<c:forEach var="item" items="${psize}">
							<div>${item}</div>
						</c:forEach>
					</div>
				</div>
						<div class="extra">
					<div class="head "><div>배송비</div></div> 
					<div class="content">
						<div>${(deliverfee_yn[0]=='Y')?'2,500원':'무료 배송'}</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div id="sub_container">
	
	</div>
</div>