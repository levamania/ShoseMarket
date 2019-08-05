<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<Script>
	function format_won(x) {
   		 return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

$().ready(()=>{
	
	
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
			//ajax
			$.ajax({
				type: "post",
				url: "/null/ProductServlet",
				data: dat,
				dataType: "text",
				success: function(data, status, xhr){
					if($(".content #sizes>div.active.pushed").length!=0){
						var price = data;
						var ele = $("#product_info>.reposit").clone();
						console.log(ele.children(":eq(2)").text());
						//콘텐츠 설정
						var code = color+"/"+dat.pSize+"/"+"${product.pName}";
						var confirm = true;
						$("#option>.content.reposit>div:first-child").each(function(){
							if($(this).text()==code){
								alert("이미 선택한 상품입니다.");
								confirm = false;
							}
						});
						if(confirm){			
							console.log(ele.children("div:eq(2)").text());
		                    ele.children("div:eq(0)").text(code)//size.text())
		                        .end().children("div:eq(1)").html("<div>+</div><input value='1' ><div>-</div>")
		                        .end().children("div:eq(2)").text(price+"("+format_won((parseInt(price)-${min_price}))+"원+)")
// 		                        	     .children.text((parseInt(price)-${min_price})).end()                    
		                        .end().children("div:eq(3)").html("<div id='delete'></div>");
							$("#option").append(ele);
						}
							$(".content #sizes>div.active.pushed").removeClass("pushed");
					}else{
						var temp = JSON.parse(data);
							for(var atom of temp){
							var size = atom.split(":")[0]; //상품 사이즈
						    var yn =true ;  //상품 재고 여부
						    if(Number.parseInt(atom.split(":")[1])=="X")yn=false;
						    
						    if(yn){
						    	$(".content #sizes>div").each(function(){
						    		if($(this).text()==size)$(this).toggleClass("active");
						    	})
						    }
						}//end for
						
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
					    $(".content #sizes>div").off("click");
 						$(this).toggleClass("active")
 								  .siblings().removeClass("active");
 						$(".content #sizes>div").removeClass("active");
						selected_inspector({"color":true},"item_size");	
				   })				   
	$(".color:first-child").trigger("click");
	//사이즈 선택
	function event_pusher(){
	$(".content #sizes>div.active").on("click",function(){
													  $(this).toggleClass("pushed");
												      selected_inspector({"color":true,"size":true},"item_selection");
												    
												  });			
	}


})

</Script>