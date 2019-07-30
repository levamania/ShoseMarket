<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
		ArrayList<String> list = new ArrayList<>();
		list.add("\'one\'");
		list.add("\'two\'");
		list.add("\'three\'");
		request.setAttribute("list", list);
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var arr = <c:out value="${list}" escapeXml="false" />;
	
	console.log(arr);
	
</script>
</head>
<body>

</body>
</html>