<%@page import="org.dto.ProductDTO"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!empty pList}">
<!-- 검색됨 -->
<div class="body searched_product">
	<div id="order_info">
	</div>
	<hr style="border:1px black solid; margin: 0;">
	<div id="other_info">
	</div>
	<hr style="border:1px gray solid; margin: 0;"> 
	<!-- 	검색된 상품들 -->
	<div id="searched_list">
		<c:forEach var="item" items="${pList}" varStatus="stat">
			<div class="product">
				<img src="/null/Content/img/shoes/${item.styleMid}/${item.styleBot}/${item.pImage}.jpg">
				<br>	
				<div class="string name">
				${item.pName}
				</div><br>
				<div class="string price">
				<!-- 가격 원화 표시 -->
				<%
					NumberFormat nbf = NumberFormat.getCurrencyInstance();
					ProductDTO item = (ProductDTO)pageContext.getAttribute("item");
					String formatted_Price = nbf.format(item.getpPrice());		
				%>
				<%=formatted_Price%>
				</div><br>
				<div class="size_info">
					주문 가능 사이즈
					<span style="display:none">${item.pCode}</span>
				</div>
			</div>	 
			<c:if test="${stat.count%5==0}"><br></c:if>
		</c:forEach>
	</div>
</div>
</c:if>
