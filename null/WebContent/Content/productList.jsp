<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- script -->
<script type="text/javascript" src="/null/Content/api/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/null/Content/js/productList.js"></script>
<!-- style -->
<link rel="stylesheet" type="text/css" href="/null/Content/css/productList.css">
</head>
<body>
<!-- 고정 탑 -->
<jsp:include page="/Content/parts/statics/01_top.jsp" flush="true"/>
<!-- 프로덕트 리스트 -->
<jsp:include page="/Content/parts/productList/searchResult.jsp" flush="true"/>
<jsp:include page="/Content/parts/productList/searchingOption.jsp" flush="true"/>
<jsp:include page="/Content/parts/productList/searchedProducts.jsp" flush="true"/>
<!--고정 바텀 -->
<jsp:include page="/Content/parts/statics/02_bottom.jsp" flush="true"/>
</body>
</html>