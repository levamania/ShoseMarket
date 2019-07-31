<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberForm</title>
<script type="text/javascript"></script>
<script>

function Check(){
    var tmp = $("#context").val().replace(/\s|　/gi, '');
    var hobbyCheck = false;

    var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)
    var id= RegExp(/^[a-zA-Z0-9]{4,12}$/)
    var pass= RegExp(/^[a-zA-Z0-9]{4,12}$/)
    var named= RegExp(/^[가-힣]+$/)
    var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
    var buf = new Array(13);




    //아이디 공백 확인

    if($("#ID").val() == ""){
     alert("아이디 입력바람");
         $("#ID").focus();
         return false;
    }

    //아이디 유효성검사
     if(!id.test($("#ID").val())){
         alert("형식에 맞게 입력해주세요");
         $("#ID").val("");
         // idCheck.value = "";
         $("#ID").focus();
         return false;
    }
 
 
   //비밀번호 공백 확인
   if($("#pass").val() == ""){
         alert("패스워드 입력바람");
         $("#pass").focus();
         return false;
    }


    //아이디 비밀번호 같음 확인
       if($("#ID").val() == $("#pass").val()){
         alert("아이디와 비밀번호가 같습니다");
         $("#pass").val("");
         $("#pass").focus();
          return false;
    }


     //비밀번호 유효성검사
     if(!pass.test($("#pass").val())){
         alert("형식에 맞게 입력해주세요");
         $("#pass").val("");
         $("#pass").focus();
          return false;
    }


    //비밀번호 확인란 공백 확인
     if($("#passch").val() == ""){
         alert("패스워드 확인란을 입력해주세요");
         $("#passch").focus();
         return false;
    }

    //비밀번호 서로확인
     if($("#pass").val() != $("#passch").val()){
         alert("비밀번호가 상이합니다");
         $("#pass").val("");
         $("#passch").val("");
         $("#pass").focus();
         return false;
    }


    //이메일 공백 확인
     if($("#email").val() == ""){
         alert("이메일을 입력해주세요");
         $("#email").focus();
         return false;
    }


    //이메일 유효성 검사
    if(!email.test($("#email").val())){
         alert("이메일형식에 맞게 입력해주세요")
         $("#email").val("");
         $("#email").focus();
         return false;
    }


    //이름 공백 검사
    if($("#names").val() == ""){
         alert("이름을 입력해주세요");
         $("#names").focus();
         return false;
    }


    //이름 유효성 검사
    if(!named.test($("#names").val())){
         alert("이름형식에 맞게 입력해주세요")
         $("#names").val("");
         $("#names").focus();
         return false;
    }


    if(($("#jumin1").val() == "") || ($("#jumin2").val() == "")){
         alert("주민등록번호를 입력해주세요");
         $("#jumin1").focus();
         return false;
    }
    if(aaa() ==false){
         return false;
    }


    //취미 유효성 검사
    for(var i=0;i<$('[name="hobby[]"]').length;i++){
         if($('input:checkbox[name="hobby[]"]').eq(i).is(":checked") == true) {
            hobbyCheck = true;
              break;
         }
     }
     if(!hobbyCheck){
         alert("하나이상 관심분야를 체크해 주세요");
         return false;
     }


    //자기소개란 공백 검사
    if(tmp== ""){
         alert("자기소개를 입력해주세요")
         $("#context").val("");
         $("#context").focus();
         return false;
    }

    return true;
}

function aaa(){
  
    var jumins3 = $("#jumin1").val() + $("#jumin2").val();
    //주민등록번호 생년월일 전달

    var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
    var buf = new Array(13);


    //주민번호 유효성 검사
    if (!fmt.test(jumins3)) {
          alert("주민등록번호 형식에 맞게 입력해주세요");
          $("#jumin1").focus();
          return false;
      }

      //주민번호 존재 검사
       for (var i = 0; i < buf.length; i++){
         buf[i] = parseInt(jumins3.charAt(i));
    }
         var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
         var sum = 0;

          for (var i = 0; i < 12; i++){
              sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
         }
           if ((11 - (sum % 11)) % 10 != buf[12]) {
              alert("잘못된 주민등록번호 입니다.");
              $("#jumin1").focus();
                return false;
                }

    var birthYear = (jumins3.charAt(6) <= "2") ? "19" : "20";
    birthYear += $("#jumin1").val().substr(0, 2);
    var birthMonth = $("#jumin1").val().substr(2, 2);
    var birthDate = $("#jumin1").val().substr(4, 2);
    var birth = new Date(birthYear, birthMonth, birthDate);
                   
  
     $("#years").val(birthYear);
     $("#months").val(birthMonth);
     $("#dates").val(birthDate);
    
}


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

</head>
<body >
<form action="../SignUpServlet" method="get">

<div id="" class="align-center vi" style="font-size:25px">
<b> </b><br>
<b> </b><br>
<b   style="color:black">NULL-MART 온라인 회원가입</b><br>

<b> </b><br>
<img src="../img/signup(check).PNG" width="45" height="auto;" id="ver4">&nbsp;&nbsp;&nbsp;<a style="font-size:50%;" > 약관동의 &nbsp;&nbsp;&nbsp;</a> 
<img src="../img/Signup(complite)2.PNG" width="45" height="auto;" id="ver4">&nbsp;&nbsp;&nbsp;<a style="font-size:50%;" > 회원정보입력&nbsp;&nbsp;&nbsp;</a> 
<img src="../img/signup(userinfo).PNG" width="45" height="auto;" id="ver4">&nbsp;&nbsp;&nbsp;<a style="font-size:50%;" > 가입완료&nbsp;&nbsp;&nbsp;</a> 
</div> <br>
<br>
<b style="font-size:80%">회원기본정보</b><div align="right"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">필수 입력정보</a></div>
<hr>
<br>
<table border="0" id="btn_group" style="text-align: left;align-self: left" >
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">아이디</a></td>
<td  width="200" height="35" ><input type="text" style="width:200px;height:50%;font-size:60%" id="userid" placeholder="영문,숫자사용 4~20자" name="userid"></td>
<td  width="100" height="35"><button class="test_btn1" style="width:33pt;height:11pt;font-size:56%" id="idcheck">중복확인</button></td>
</tr>
 <tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">비밀번호</a></td>
<td width="200" height="35" colspan="0"><input type="password" style="width:200px;height:50%;font-size:60%" id="passwd"  placeholder="영문,숫자사용,특수문자 사용
 4~20자" name="passwd"></td>
</tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">비밀번호확인</a></td>
<td width="200" height="35" ><input type="password" style="width:200px;height:50%" id="passwd2"></td>
</tr>
 <tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">이름</a></td>
<td width="200" height="35" colspan="0"><input type="text" style="width:200px;height:50%" id="username" name="username"></td>
</tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:white" >*  </a><a  style="font-size:60%">성별</a></td>
<td width="100" height="35"><a style="font-size:60%">남</a><input type="checkbox" id="check1"style="height: 15px" name="sex" value="XY">
<a style="font-size:60%">여</a><input type="checkbox" id="check2" style="height: 15px;"name="sex" value="XX"></td>
</tr>
 <tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">이메일</a></td>
<td width="100" height="35" colspan="0"><input type="text" style="width:70px;height:50%" id="email1" name="email1"><a>@</a>
<input type="text" style="width:100px;height:50%;font-size:60%" id="email2" name="email2" placeholder="예) null.com"></td>
<td><select  id="emailSelect"><option value="naver.com" id="naver">naver.com</option>
<option value="softbank.jp" id="softbank">softbank.jp</option>
<option value="daum.net" id="daum">daum.net</option>
</select>
<button class="test_btn1" style="width:33pt;height:11pt;font-size:56%" id="emailcheck">중복확인</button></td>
</tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">우편번호</a></td>
<td width="200"height:50%" >
<input style="width:70px;height:50%;font-size: 70%" type="text" name="post" id="sample4_postcode" placeholder="우편번호">
<button class="test_btn1" style="width:45pt;height:11pt;font-size:56%" id="post"  onclick="sample4_execDaumPostcode()" type="button">우편번호찾기</button></td></tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">주소</a></td>
<td width="200" height="35"><input style="width: 80%;height:50%;font-size:60%" type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소"></td>
<td width="200" height="35"><input style="width: 80%;height:50%;font-size:60%" type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" ></td></tr>
<tr>
<td width="100" height="35"></td>
<td width="200" height="35"><input style="width: 80%;height:50%;font-size:60%" type="text" name="addr3" id="sample4_jibunAddress" placeholder="상세주소"></td>
</tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">전화번호</a></td>
<td width="200" height="35"><select name="phone1" >
  <option style="width: 20%;height:50%;font-size:80%" value="010" id="010">010</option>
  <option style="width: 20%;height:50%;font-size:80%" value="011" id="011">011</option>
</select>-
<input style="width: 30%;height:50%;font-size:60%" type="text" name="phone2" >-<input style="width: 30%;height:50%;font-size:60%" type="text" name="phone3" > </td>
</tr>
</table>
<br>
<br>
<hr>
<br>
<div id="btn_group" class="align-center vi">
<button style="width: 120px;height: 40px;font-size: 20px;border: 1px solid red;background-color: red;color: white;font-weight:600" type="submit">회원가입</button>
<button style="width: 120px;height: 40px;font-size: 20px;border: 1px solid red;background-color: white;color: red;font-weight:600" onclick="location.href='main.jsp'">취소</button>
</div>
</form>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</body>
</html>