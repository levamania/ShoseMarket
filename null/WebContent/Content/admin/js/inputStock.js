/**
 * 
 */
$(document).ready(function() {
	var pname = $("#pname");
	var pcode = $("#pcode");
	var pamount = $("#pamount");
	var pprice = $("#pprice");
	var checkpcode = $("#checkpcode");
	
	var ppriceReg  = /^\d{1,12}$/;//숫자 1~12
	var pnameReg = /^[가-힝A-Za-z0-9]{1,20}$/;//특수문자x
	var pcodeReg = /^[0-9A-Za-z]{1,10}$/;//영어 숫자만
	
	var sizes = [];
	for(var i=200;i<=300;i+=5){
		sizes.push(i);
	}
	$('#psize').empty();
	 
	for(var i = 0; i < sizes.length; i++){                
		var option = $("<option>"+sizes[i]+"</option>");
	    $('#psize').append(option);
	 }
	function checkReg(tag, reg,mesg){
		if(!reg.test(tag.val())){
			alert(mesg);
			tag.val("");
			tag.focus();
			return true;
		}else{
			return false;
		}
	}
	
	//check버튼으로 pname, pcode 찾기만 일치 
	checkpcode.on("click",function(){
		if(!(pname.val()+pcode.val())){
			alert("pname, pcode를 입력하세요");
			return;
		}else if(pname.val().length==0){
			if(checkReg(pcode,pcodeReg,"pcode 입력 확인")){
				return false;
			}
		}else if(pcode.val().length==0){
			if(checkReg(pname,pnameReg,"pname 입력 확인")){
				return false;
			}
			
		}else {
			if(checkReg(pcode,pcodeReg,"pcode 입력 확인")){
				return false;
			}
			if(checkReg(pname,pnameReg,"pname 입력 확인")){
				return false;
			}
			
		}
		$.ajax({
			type: "get",
			url: "/null/InputStockServlet",
			data:{pname:pname.val(),pcode:pcode.val()},
			dataType: "text",
			success: function(data,status,xhr){
				console.log(data);
			},
			error: function(xhr,status,e){
				console.log("error: ",e);
				console.log("status: ",status);
			}
			
		});
	});
	
	$("form").on("submit",function(){
		
	});
	
});