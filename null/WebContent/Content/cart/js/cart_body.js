function toWon(price){
		if(typeof price=="number"){
			price = price.toString();
		}
	
		var arr = new Array();
		for(var i=0;i<price.length;i++){
			arr.push(price.charAt(i));
		}
		for(var i=1;price.length-i*3>0;i++){
			arr.splice(price.length-i*3,1,","+arr[price.length-i*3]);
		}
		var string ="";
		for(var i of arr){
			string+=i;
		}	
		return string+" 원"; 
	}

//숫자변환 함수
function toNum(price){
	var regEx = /\d{1,100}/g;
	var x = price.match(regEx);
	var string = "";
	for(var i of x){
		string+=i;
	}
	return Number.parseInt(string);
}

//상품삭제함수
function deleteList(cno,pamount,scode){
	//성공여부결정
	var success = false;	
	var temp = new Array();
	
	console.log(cno, pamount, scode);
	//ajax
	$.ajax({
		method:"post",
		url: "/null/CartDeleteServlet",
		async:false,
		data: {
			CNO : cno,
			PAMOUNT : pamount,
			SCODE : scode
		},
		type:"text",
		success:function(data){
			if(data=="success"){
				success=true;
			}
		},
		error:function(error){
			console.log(error);
		}
	})//end ajax
	
	return success;
}

//가격 재설정 함수
function setPrice(){
	var tot = 0;
	$(".content:nth-child(n+2)").each(function(){
		var sum = 0;
		//주문금액 설정
		$(this).find(".group").each(function(){
			var decart = $(this).find(".decart");
			var sell = $(this).find(".sell");
			var count = $(this).find(".count");
			
			var temp = toNum(count.text())*toNum(sell.text());
			decart.text(toWon(temp));
			sum+= temp;
		})
		$(this).find(".small_sum").text(toWon(sum));
		tot+=sum;
	})
	$("#temp").text(toWon(tot));
	$("#final").text(toWon(tot+2500));

};

//배송비 설정 함수


//빈공간 채우는 함수
function fill_blank(){
	var html = `<div class='content' style='height:100px;'>
							<div>담겨진 상품이 없습니다!</div>
					  </div>`;
	if($("#cart_list").find(".name").length==0){
		$("#cart_list").append(html).append($(".last"));
	}
}


$().ready(()=>{

	//자동 스크롤 함수
	var distance = 0;
  		$(".top1, .top2").each(function(){
  			distance += toNum($(this).css("height"));
  		})
	var position = 0;
	function scroller(){	
		if (position < distance){
	    	position+=10;
	    	scroll(0,position);
	    	clearTimeout(timer);
	    	var timer = setTimeout(scroller,0); timer;
	    }
	 }
	scroller();
	
	
	//css 설정
	function gap_sizing(){
		$(".group .head").parents(".group").css({"margin-top":"5px"});		
	}
	gap_sizing();
		//원화설정
	$(".num").each(function(){
		$(this).text(toWon($(this).text()));
	})
	fill_blank();
	
		//상품이름 설정
	$(".content").each(function(){
		$(this).find(".pname").text($(this).find(".name").eq(0).text());
	})
	
	//chief checkbox 설정
	$("input.chief").on("change",function(){
		var same  = $(this).prop("checked");
		$(".content").find(".selection").prop("checked",same);
	})

	//선택 삭제버튼 설정
	$("#optional_delete").on("click",function(){
		$(".content").find(".selection").each(function(){
			if($(this).prop("checked")){
				$(this).parents(".content").find(".quak").trigger("click")
				  .end().remove();
			}
		})
	})
	
		//content 삭제
	$(".decision>div:nth-child(2)").on("click",function(){
		//
		$(this).parents(".content").find(".quak").trigger("click")
				  .end().remove();
	})
	
	//개별 상품 삭제버튼 기능 추가
	$(".content").find(".quak").on("click",function(){
		//해당 상품 삭제 
		var temp=new Array();
		$(this).siblings("div").children("span").each(function(){
			temp.push($(this).text().trim());
		})
		var [a,b,c] = temp;
		var scode = a+"/"+b+"/"+c;
		var pamount = toNum($(this).parent(".option").siblings(".count").text());
		var cno = $(this).siblings(".cno").text();
		
		
		if(deleteList(cno,pamount,scode)){
			//버튼 삭제
			var sibling = $(this).parents(".group").siblings();
			$(this).parents(".group").remove();
			//투명도 설정
			var solo = true;
			sibling.each(function(){
				var colored = $(this).find(".option>div>span:first-child");
				var hidden = colored.text();
				var neighbors = $(this).siblings().find(".option>div>span:first-child");
				for(var color of neighbors){
					if(hidden==$(color).text())solo=false;
				}
				if(solo||!colored.hasClass("head")){
					colored.addClass("head").css({"opacity":"1"});
					gap_sizing();
				}
			})
			//가격 재설정
			setPrice();
			//blank 확인
			fill_blank();
		}
		
	})//end fuc
	
	

	

	







})//end ready

