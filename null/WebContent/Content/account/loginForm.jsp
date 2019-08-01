<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<script src="/null/Content/api/jquery/jquery-3.4.1.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	function check(re, what, message) {
		if (re.test(what.val())) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		return false;
		console.log("작동 테스트");
	}
	//id중복체크
	$('#idcheck').on("click",function(){
		var id = $("#userid");
		$.ajax({
			type : "get",
			url : "/null/IdCheckServlet",
			data : {userid:id.val()},
			dataType : "text",
			success : function (data,status,xhr){
				console.log('확인');
				console.log(data);
				if(data==1){
					alert("사용불가능입니다.");
					/* window.open("idCheck.jsp","idCheck","width=100,height=50,resizable=no,scrollbars=no"); */

					$("#userid").focus();
					return false;
				}else{
					/* window.open("idCheckPass.jsp","idCheck","width=100,height=50,resizable=no,scrollbars=no"); */
                    alert("사용가능입니다.");
					$("#userid").focus();
					return false;
					
				}
			},
			error:function(xhr,status,e){
				console.log("error",e);
				console.log("status",status);
			}
		});
				
		
	});
	
	//이메일 change
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

	
	
	//기본 유효성검사
	
	$("form").on("submit",function(event){

			var re = /^[a-zA-Z0-9]{4,12}$/ 
			var re1 = /^[a-zA-Z0-9~!;:]{4,12}$/ 
		

			var id = $("#userid");
			var pw = $("#passwd");
			var pw2 =$("#passwd2");
		
			if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력하시오")) {
				return false;

			}
			

			if (!check(re1, pw, "패스워드는 4~12자로 입력하시오)) {
				return false;
			}

			
		
		
	});
	
	
});








</script>

<style type="text/css">
html, body {
	max-width: 80%; height: 100%;
	margin: auto;
	
}
    .vi{
       /*  border-radius: 5px;
        background-color: #2e5b86;
        border-style: solid;
        border-color: #5d5d5d;
        border-width: 2px;
        color: #FFFFFF;
        margin-bottom: 5px;
        padding:15px;
        width:400px */
    }
    .align-left { text-align: left; }
    .align-center { text-align: center; }
    .align-justify { text-align: justify; }
    .margin-center {
        margin-left:auto;
        margin-right:auto;
    }
   .test_btn1{
            margin-right:-4px;
        }
        #test_btn2{
            margin-left:-3px;
        }
        #btn_group button{
            
            border: 1px solid lightgray;
            background-color: white;
            color: black;
            padding: 1px;
        }#table{
        font-size:8px;
        margin-center:auto;
        
        }
        
       body {
        
    }
    img {
       
    }
    #ver1 {vertical-align: base;}
    #ver2 {vertical-align: sub;}
    #ver3 {vertical-align: super;}
    #ver4 {vertical-align: text-top;}
    #ver5 {vertical-align: text-bottom;}
    #ver6 {vertical-align: top;}
    #ver7 {vertical-align: middle;}
    #ver8 {vertical-align: bottom;}
    #ver9 {vertical-align: 50%;}
    #ver10 {vertical-align: 10pt;}
    
    .line{border-bottom:1px solid lightgray;
          border-top:1px solid lightgray};

</style>




 <form name="login" action="/null/LoginServlet" method="get">

<table border="0" id="btn_group" style="text-align: left;align-self: left" >
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">아이디</a></td>
<td  width="200" height="35" ><input type="text" style="width:150px;height:80%;font-size:70%" id="userid" placeholder="영문,숫자사용 4~12자" name="userid"></td><br>
</tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">패스워드</a></td>
<td  width="200" height="35" ><input type="text" style="width:150px;height:80%;font-size:70%" id="passwd" placeholder="영문,숫자,특수문자사용 4~12자" name="passwd"></td><br>
</tr>
</table>
<input type="submit" value="  로그인 " class="test_btn1" style="width:53pt;height:15pt;font-size:76%;background-color: red;border-color: red;color: white;border-style: hidden;" />
<input type="reset" value="취소" class="test_btn1" style="width:53pt;height:15pt;font-size:76%;background-color: red;border-color: red;color: white;border-style: hidden;">
      </form>
</body>
</html>