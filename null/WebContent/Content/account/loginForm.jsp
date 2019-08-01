<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
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




 <form name="login" action="LoginServlet" method="get">

<table border="0" id="btn_group" style="text-align: left;align-self: left" >
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">아이디</a></td>
<td  width="200" height="35" ><input type="text" style="width:150px;height:80%;font-size:70%" id="userid" placeholder="영문,숫자사용 4~20자" name="userid"></td><br>
</tr>
<tr>
<td width="100" height="35"><a  style="font-size:60%;color:red" >* </a><a  style="font-size:60%">패스워드</a></td>
<td  width="200" height="35" ><input type="text" style="width:150px;height:80%;font-size:70%" id="passwd" placeholder="영문,숫자사용 4~20자" name="passwd"></td><br>
</tr>
</table>
<input type="submit" value="  로그인 " onclick="Login();"class="test_btn1" style="width:53pt;height:15pt;font-size:76%;background-color: red;border-color: red;color: white;border-style: hidden;" />
<input type="reset" value="취소" class="test_btn1" style="width:53pt;height:15pt;font-size:76%;background-color: red;border-color: red;color: white;border-style: hidden;">
      </form>
</body>
</html>