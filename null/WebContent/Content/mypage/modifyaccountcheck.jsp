<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<style type="text/css">
	#body{
		position: relative;
		display: inline-block;
		vertical-align: top;
	}
	#body_content{
		display: inline-block;
		position: absolute;
		width: 900px;
		height: 140px;
		background-color: #F6F6F6;
		border-top: 1px solid #FFD9FA;
		border-bottom: 1px solid #FFD9FA;
		padding-top: 18px;
		padding-left: 20px;
	}
	
</style>
</head>
<body>
<script src="/null/Content/api/jquery/jquery-3.4.1.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div id="body">
<div style="height: 30px; margin-top: 4px; font-weight: bold;">개인정보수정</div>
<div id="body_content">
<table>
	<tr>
		<td><img src="/null/Content/img/mypage/lock.PNG" width="100" height="100" style="margin-right: 40px;"></td>
		<td>
			<p style="font-weight: bolder; font-size: 20px;">비밀번호 재확인</p>
			<p>고객님의 소중한 개인정보를 보호하기 위해 비밀번호를 다시 한번 확인합니다<br>
			비밀번호 입력 시 타인에게 노출되지 않도록 주의해 주시기 바랍니다.</p>
		</td>
	</tr>
</table>
</div>

</div>
</body>
</html>