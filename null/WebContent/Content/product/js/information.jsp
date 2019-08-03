<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<Script>
	//원화로 바꾸는 함수
	function toWon(price){
		console.log(typeof price)
		if(typeof price=="number"){
			price = price.toString();
		}
	
		var arr = new Array();
		for(var i=0;i<price.length;i++){
			arr.push(price.charAt(i));
		}
		for(var i=1;price.length-i*3>0;i++){
			console.log(arr);
			arr.splice(price.length-i*3,1,","+arr[price.length-i*3]);
		}
		var string ="";
		for(var i of arr){
			string+=i;
		}	
		return string; 
	}

$().ready(()=>{
	
	//색상 클릭시 => 색상에 존재하는 색상정보, 사이즈 클릭시 => 사이즈와 색상정보를 넘겨 상응하는 레코드의 가격정보
	function selected_inspector(param, source){
		var color = null;
		var size = null;
		var dat = {
				"pCode": "${product.pCode}",
				"source": source
		};
	
		if(param.color){
			color = document.querySelector(".color.active").style.backgroundColor.toUpperCase();
			dat.pColor = color;
		}
		if(param.size){
			size = $(event.target).text();
			dat.pSize = size;
		}
		
		
		if(color.length!=0||$(".size.active").length!=0){
			//클래스 제거
			//ajax(ajax로 자바에 null값을 보내는면 인식불가능해진다.)
			$.ajax({
				type: "post",
				url: "/null/ProductServlet",
				data: dat,
				dataType: "text",
				success: function(data, status, xhr){
					//푸쉬 클래스가 존재할때만 작동
					if($(".content #sizes>div.active.pushed").length!=0){
						var price = Number.parseInt(data);
						var ele = $("#product_info>.reposit").clone();
						//콘텐츠 설정
						var code = color+"/"+dat.pSize+"/"+"${product.pName}";
						var confirm = true;
						//새로 저장할 상품과 이전의 상품이 같은지 확인
						$("#option>.content.reposit>div:first-child").each(function(){
							if($(this).text()==code){
								alert("이미 선택한 상품입니다.");
								confirm = false;
							}
						});
						if(confirm){			
		                    ele.children("div:eq(0)").text(code)//size.text())
		                        .end().children("div:eq(1)").html("<div>+</div><input value='1' ><div>-</div>")
		                        .end().children("div:eq(2)").text( toWon(price)+"("+toWon(price-${min_price})+"원+)")
// 		                        	     .children.text((parseInt(price)-${min_price})).end()                    
		                        .end().children("div:eq(3)").html("<div id='delete'></div>");
							$("#option").append(ele);
						}
							$(".content #sizes>div.active.pushed").removeClass("pushed");
					}else{
						var temp = JSON.parse(data); //사이즈와 양만을 바인딩하여 가져옴
							for(var atom of temp){
								var size = atom.split(":")[0]; //상품 사이즈
							    var yn =true ;  //상품 재고 여부
							    if(Number.parseInt(atom.split(":")[1])=="X")yn=false;
						    
						   		 //
						   		if(yn){
						   	 		$(".content #sizes>div").each(function(){
						    			if($(this).text()==size)$(this).toggleClass("active");
						    		})
						   		}
						}//end for
						
						//가져온 사이즈에 선택적으로 이벤트 활성화
						event_pusher();			
					}//end esle
				},
				error: function(status, xhr, error){
					console.log(error);
				}
			});//end ajax
		}//end if
	}//end fucntion
	

	//color 선택
	$(".color").on("click",function(){
					 	//사이즈 재선택시 사이즈에 있던 이벤트 재거
					    $(".content #sizes>div").off("click");
					 	//선택한 색깔을 활성화 시켜 선택했다는 것을 보여줌
 						$(this).toggleClass("active")
 								  .siblings().removeClass("active");//다른 색상의 active제거, unique active
 						//이전에 사이즈 선택으로 활성화 되었이던 사이즈 버튼들 비활성화
 						$(".content #sizes>div").removeClass("active");
 						//색상에 맞는 사이즈 리스트 
						selected_inspector({"color":true},"item_size");	
				   })
	//최초 상품 리스트 요청시 첫번째 색상 선택됨
	$(".color:first-child").trigger("click");
	
	//사이즈 선택 이벤트 함수( 색선택시 마다 다른 사이즈에 이벤트를 부여하고 지워야 하므로 한번의 실행으로는 불가, 함수로 여러번 실행시킨다.)
	function event_pusher(){
	//활성화 되어있는 사이즈클릭시 푸쉬클래스를 토글하고 
	//색상과 사이즈 정보를 합쳐 REPOSIT생성
	$(".content #sizes>div.active").on("click",function(){
													  $(this).toggleClass("pushed");//푸쉬 토글 후 리토글 필요
												      selected_inspector({"color":true,"size":true},"item_selection");
												    
												  });			
	}
	//reposit 삭제버튼 설정 => 리파짓이 생설될때마다 부여되어야한다.
	$("#option>.content.reposit #delete")
		.on("click",function(){
			//해당 버튼의 부모=리파짓 통째로 삭제
			$(this).parent().remove();
		})

})


	//결제버튼 설정
	$("#payment>div").eq(1).on("click",()=>location.href="")
					 .eq(2).on("click",()=>location.href="CartServlet")
					 .eq(3).on("click",()=>location.href="OrderServlet");

</Script>