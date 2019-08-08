

//리파짓 설정하기
var reposit = {};
function push_atom(ele){
	//객체에 저장
	var category = $(ele).parents(".category_option").attr("id").toUpperCase();
	var text = $(ele).text();
	//리스트가 없을 경우
	if(reposit[category]==undefined){
		reposit[category] = new Array();
	}
	//사이즈 셀렉트
	if(category=="PSIZE"&&reposit[category].length==2){
		var small_one = Number.parseInt(reposit[category].shift());
		var large_one = Number.parseInt(reposit[category].pop());
		var size = Number.parseInt(text);
		
		//사이즈가 크거나 작을 경우
		if(size<small_one){
			//배열 채우기
			reposit[category].unshift(size);
			reposit[category].push(large_one);
			//small one 해제
			$("#psize>.value>div:contains('"+small_one.toString()+"')").trigger("click");						
		}else if(size>large_one){
			reposit[category].unshift(small_one);
			reposit[category].push(size);
			//large one 해제
			$("#psize>.value>div:contains('"+large_one.toString()+"')").trigger("click");
		}else{ //바깥이 아닌 사이가 선택되었을 경우
			//최소에서 ele까지 카운트
			var s_count = 0;
			var e_count = 0;
			
			var less = $("#psize>.value>div:contains('"+small_one.toString()+"')");
			var more = $("#psize>.value>div:contains('"+large_one.toString()+"')");
			
			less.nextAll().each(function(){
				if($(this).text()==size)return false;
				s_count++;
			})
			more.prevAll().each(function(){
				if($(this).text()==size)return false;
				e_count++;
			})
			// 간격구별
			if(s_count>e_count){
				reposit[category].unshift(less.text());
				reposit[category].push(size);
				more.trigger("click");
			}else if(s_count<=e_count){
				reposit[category].unshift(size);
				reposit[category].push(more.text());
				less.trigger("click");
			}
		
		}//end size-argo
		
	}else{		
		reposit[category].push(text);
	}
	
	
	//화면구현
	var html = `<div class="optical">
							<div>${text}</div><span style="display:none;">${category}</span>
							<div></div>
					  </div>`;
	$("#collection>.value").append(html);
	
	//삭제 기능 추가
	add_delete();
}

//리파짓 atom 삭제 추가 기능
function add_delete(){
	$("#collection .optical").on("click",function(){
		//객체에서 제거
		var id = $(this).find("span").text();
		var text = $(this).find("div:first-child").text();
		var count =0;
		for(var atom of  reposit[id]){
			if(atom==text)break;
			count++;
		}
		reposit[id].splice(count,1);
		if(reposit[id].length==0)delete reposit[id];
		
		
		//푸쉬 해제
		var x = $(("#"+id).toLowerCase()).find("div:contains('"+text+"')");
		x.removeClass("pushed");
		//자기삭제
		$(this).remove();
	})
}

$().ready(()=>{
	
	//css 설정
		//선택 설정
	$(".value>div").on("click",function(){
		var id = $(this).parents(".category_option").attr("id");
		if(id!="collection"){
			//리파짓에 설정 저장하기
			if($(this).hasClass("pushed")){
				var text = $(this).text();
				//id 와 문자열이 같은 optical 클릭
				$("#collection .optical>span:contains('"+id.toUpperCase()+"')")
				.siblings(":contains('"+text+"')").parent(".optical").trigger("click");
			}else{
				push_atom(this);				
				//클래스 토글
				$(this).toggleClass("pushed");
			}
		}
	})
	
	
		//카테고리 버튼 설정
	var prev_clicked = null;
	$("#stylemid .value>div:nth-child(2n)").on("click",function(){
		//css
		var style = $("#stylemid .value>div");
		var deeper = $("#stylemid .deeper"); 
		if(deeper.css("display")=="none"){
			prev_clicked = this;
			style.css({"margin-top":"10px"});
			deeper.css({"display":"flex"});			
		}else{
			if(prev_clicked!=this){
				prev_clicked = this;
				style.css({"margin-top":"10px"});
				deeper.css({"display":"flex"});			
			}else{
				style.css({"margin-top":"0"});
				deeper.css({"display":"none"});
			}
		}
		
	})
		.on("mouseover mouseout",function(){
			$(this).prev().toggleClass("overed");
		})
	
	
	
	
	//전체해제 설정
	$("#collection #purge").on("click",function(){
		$("#collection .optical").trigger("click");
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})