<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchPw</title>
<script src="/null/Content/account/jquery-3.4.1.js"></script>
<jsp:include page="/Content/statics/top/top.jsp" flush="true" />
<script src="/null/Content/api/jquery/jquery-3.4.1.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#emailSelect').change(function(){
		   $("#emailSelect option:selected").each(function () {
				
				if($(this).val()== '1'){ //직접입력일 경우
					 $("#email2").val('');                        //값 초기화
					 $("#email2").attr("disabled",false); //활성화
				}else{ //직접입력이 아닐경우
					 $("#email2").val($(this).text());      //선택값 입력
					 $("#email2").attr("disabled",true); //비활성화
				}
		   });
		});

});



</script>
</head>
<body>

<form name="login" action="/null/LoginServlet" method="get" id="check">
		<div align="center" style="font-size: 200%">
			<br> <br> <b>비밀번호 찾기</b>
		</div>
		<br>
		<div align="center" style="font-size: 80%;color: gray">
			<br> <br> <a>비밀번호를 잊어버리셨나요?
                        <br>
                        그럼 찾아보세요!</a>
		</div>
		<br> <br>
		<hr>
		<table border="0" align ="center" >
<tr>
<td width="100" height="35"><a  style="font-size:60%">아이디</a></td>
<td  width="200" height="35" ><input type="text" style="width:200px;height:50%;font-size:60%" id="userid" placeholder="영문,숫자사용 4~20자" name="userid"></td>

</tr>
 
 <tr>
<td width="100" height="35"><a  style="font-size:60%">이름</a></td>
<td width="200" height="35" colspan="0"><input type="text" style="width:200px;height:50%" id="username" name="username"></td>
</tr>

 <tr>
<td width="100" height="35"><a  style="font-size:60%">이메일</a></td>
<td width="100" height="35" colspan="0"><input type="text" style="width:70px;height:50%" id="email1" name="email1"><a>@</a>
<input type="text" style="width:100px;height:50%;font-size:60%" id="email2" name="email2" placeholder="예) null.com"></td>
<td><select  id="emailSelect"><option value="naver.com" id="naver">naver.com</option>
<option value="softbank.jp" id="softbank">softbank.jp</option>
<option value="daum.net" id="daum">daum.net</option>
</select>
<!-- <button class="test_btn1" style="width:33pt;height:11pt;font-size:56%" id="emailcheck">중복확인</button> --></td>
<td><button type="button"
			style="width: 25pt; height: 10pt; font-size: 60%; background-color: red; border-color: red; color: white; border-style: hidden;"
			onclick="location.href='searchId.jsp' ">요청</button> </td>
</tr>

			</table>
			
	</form>

	<br>
	<hr>



</body>
</html>