$().ready(()=>{

	/*************유효성 검사***************/
	
	function check(ele,regex,mesg){
		if(!regex.test(ele.val())){
			ele.focus();
			throw mesg;
		}
	}
	
	var namingEx = /[가-힣]{3,10}/;
	var phoningEx = /\d{4}/;
	
	var telelingEx1 = /\d{3}/;
	var telelingEx2 = /\d{4}/;
	
	var emailingEx1 = /^[a-z][a-z0-9]{4,15}$/;
	var emailingEx2 = /^[a-z][a-z]{4,10}[.](com|co.kr|org|net)$/;
	
	var messagingEx = /([a-zA-z가-힣]|[* - . \\ /]){0,40}/;
	
	
	
	//결제
	$("#decision").on("click",function(){
		var form = document.form1;
		form.action = "/null/OrderServlet";
		try{
			//주문고객
			check($("#customer #user"), namingEx, "고객 이름을 확인하세요");
			check($("#customer input[name='user_phone2']"), phoningEx, "휴대폰번호를 확인하세요");
			check($("#customer input[name='user_phone3']"), phoningEx, "휴대폰번호를 확인하세요");
			check($("#customer input[name='user_email1']"), emailingEx1, "이메일을 확인하세요");
			check($("#customer input[name='user_email2']"), emailingEx2, "이메일을 확인하세요");
			
			//수령고객
			check($("#address input[name='order_name']"), namingEx, "수령인 이름을 확인하세요");
			check($("#address input[name='order_phone2']"), phoningEx, "휴대폰번호를 확하세요");
			check($("#address input[name='order_phone3']"), phoningEx, "휴대폰번호를 확하세요");
			check($("#address input[name='order_telephone2']"), telelingEx1, "전화번호를 확하세요");
			check($("#address input[name='order_telephone3']"), telelingEx2, "전화번호를 확하세요");
	
			check($("#address input[name='order_postcode']"), /\d{4,5}/, "우편번호를 선택해주세요");	
			check($("#address input[name='order_mesg']"), messagingEx, "배송 메세지를 확인해주세요, 40자 이내입니다.");
			
			form.submit();
		}catch (error) {
			alert(error);
		}
			
	})
	
	//주문자 변경
	var user_info = {
								"name": $("#customer #user").val(),
								"phone1": $("#customer input[name='user_phone2']").val(),
								"phone2": $("#customer input[name='user_phone3']").val(),
								"email1": $("#customer input[name='user_email1']").val(),
								"email2": $("#customer input[name='user_eamail2']").val()
		
							}
	
	$("#customer input[type='text']").prop("readonly",true);	
	$("#customer select").prop("disabled",true);	
	
	$("#customer input[type='checkbox']").on("click",function(){
		var inputes = $("#customer input[type='text']");
		var select = $("#customer select");
		if($(this).prop("checked")){
			inputes.prop("readonly",false);	
			select.prop("disabled",false);	
		}else{
			$("#customer #user").val(user_info["name"]);
			$("#customer input[name='user_phone2']").val(user_info["phone1"]);
			$("#customer input[name='user_phone3']").val(user_info["phone2"]);
			$("#customer input[name='user_email1']").val(user_info["email1"]);
			$("#customer input[name='user_eamail2']").val(user_info["email2"]);
			inputes.prop("readonly",true);	
			select.prop("disabled",true);	
		}
	})
	//
	
	
	
	
	
})

