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
	$("form").on("submit", function(event) {

		var id = $("#userid");
		var un = $("#username");
		var em1 = $("#email1");
		var em2 = $("#email2");

		if (id.val() == "") {
			alert("아이디를 입력하시오")
			id.focus();
			return false;
		}
		if (un.val() == "") {
			alert("이름을 입력하시오")
			un.focus();
			return false;
		}
		if (em1.val() == "") {
			alert("이메일을 입력하시오")
			em1.focus();
			return false;
		}
		if (em2.val() == "") {
			alert("이메일을 입력하시오")
			em2.focus();
			return false;
		}
	});
		$('form').on("submit", function() {
			var id = $("#userid");
			var un = $("#username");
			var em1 = $("#email1");
			var em2 = $("#email2");
			$.ajax({
			
			
			type : "get",
			url : "/null/SearchPwServlet",
			data : {
				userid : id.val(),
				username : un.val(),
				email1 : em1.val(),
				email2 : em2.val()
			},
			dataType : "text",
			success : function(data, status, xhr) {
				console.log('확인');
				console.log(data);
				if (data == 0) {
					alert("올바른 정보를 입력해주세요.");
					

					$("#userid").focus();
					return false;
				} else {
					alert("메일이전송되었습니다..")
					 
					$("#userid").focus();

					return false;

				}
			},
			error : function(xhr, status, e) {
				console.log("error", e);
				console.log("status", status);
			}
		

	});

	});
});





</script>
<style type="text/css">
 body {
	max-width: 80%; height: 100%;
	margin: auto;
	
}
</style>
</head>
<body>

<form action="/null/SearchPwServlet" method="get" id="search" >
		<div align="center" style="font-size: 200%">
			<br> 
			<br> <b>비밀번호 찾기</b>
		</div>
		<br>
		<div align="center" style="font-size: 80%;color: gray">
			<br> 
			<br> <a>비밀번호를 잊어버리셨나요?
                        <br>
                        그럼 찾아보세요!</a>
		<br> 
		<br>
		<a>email로 찾기</a>
		</div>
		<hr>
		<table>
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
<option value="hanmail.net">hanmail.net</option> 
				<option value="hotmail.com">hotmail.com</option> 
				<option value="nate.com">nate.com</option> 
				<option value="yahoo.co.kr">yahoo.co.kr</option> 
				<option value="empas.com">empas.com</option> 
				<option value="dreamwiz.com">dreamwiz.com</option> 
				<option value="freechal.com">freechal.com</option> 
				<option value="lycos.co.kr">lycos.co.kr</option> 
				<option value="korea.com">korea.com</option> 
				<option value="gmail.com">gmail.com</option> 
				<option value="hanmir.com">hanmir.com</option> 
				<option value="paran.com">paran.com</option>
</select>
</td>
<td><button type="submit"
			style="width: 25pt; height: 10pt; font-size: 60%; background-color: red; border-color: red; color: white; border-style: hidden;"
			>요청</button> </td>
</tr>

			</table>
			
	</form>

	<br>
	<hr>



</body>
</html>