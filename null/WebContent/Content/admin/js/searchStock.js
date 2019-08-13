/**
 * 
 */

//function initSelector(selector,options){
//	for(var optionObj of options){
//		var optionName = optionObj.option;
//		var option = $("<option>"+optionName+"</option>");
//		selector.append(option);
//	}
//}

//페이지 로딩시 실행 함수 
//ajax로 상품이름을 가져옴
//상품명 입력시 자동으로 키워드 검색
$(document).ready(function(){
	var keywords = [];
	var keyupflag = false;
	var pname = $("#pname");
	$.ajax({
		type: "get",
		url: "/null/GetInitSearchStockServlet",
		dataType: "json",
		success: function(data,status,xhr){
			for(var value of data.keywords){
				keywords.push(value.keyword);
			}
			console.log(data);
			$(function(){
				$("#pname").autocomplete({
					source:keywords
				});
			});
			
		},
		error: function(xhr,status,e){
			console.log("error: ",e);
			console.log("status: ",status);
		}
	});
	//pnanme keyup event
	//keyup 이벤트 후 입력된 값있으면 외부 변수(keyupflag)설정 
	pname.on("keyup",function(){
		if(pname.val().length!=0){
			console.log("keyup");
			keyupflag=true;
		}else{
			keyupflag=false;
		}
	});
	//pname blur event
	//외부 변수에 따라 ajax. 호출 
	pname.on("blur",function(){
		if(keyupflag){
			console.log("blur");
			//ajax json 응답 처리 
			$.ajax({
				type: "get",
				url: "/null/GetInitSearchStockServlet",
				data: {pname:pname.val()},
				dataType: "json",
				success: function(data,status,xhr){
					if(data==0){
						alert("없는값");
					}else{
						console.log(data.pcode);
						console.log(data.styletop);
						console.log(data.stylemid);
						console.log(data.stylebot);
						console.log(data.pregitdate);
					}
					
				},
				error: function(xhr,status,e){
					console.log("error: ",e);
					console.log("status: ",status);
				}
			});
		}
		
	});
	
});


//css background red 값 제거 
function dateValueRemoveCss(){
	$(".dateValue").each(function(idx,button){
		$(this).css("background-color","");
	});
}

//날짜 버튼 클릭시 css 설정 
// dateValue 설정
$(document).ready(function() {
	var searchDate = $("#searchDate");
	var date1 = $("#date1");
	var date2 = $("#date2");
	searchDate.val("");
	
	//날짜 입력 버튼 클릭
	$(".dateValue").each(function(idx,button) {
		$(this).on("click",function(){
			dateValueRemoveCss();
			$(this).css("background-color","red");
			var date= $(this).text();
			searchDate.val(date);
		});
	});
	
	//날짜 date input 태그 유효성
	date1.on("change",function(){
		dateValueRemoveCss();
		if(searchDate.val()){
			searchDate.val("");
		}
		if(date2.val()!=0){
			if(date1.val()>date2.val()){
				alert("첫번째 날짜가 두번째 날짜보다 늦을 수 없습니다.");
				$(this).val("");
				$(this).focus();
				return;
			}
			searchDate.val(date1.val()+date2.val());
		}
	});
	//날짜 date input 태그 유효성
	date2.on("change",function(){
		dateValueRemoveCss();
		if(searchDate.val()){
			searchDate.val("");
		}
		if(date1.val()!=0){
			if(date1.val()>date2.val()){
				alert("첫번째 날짜가 두번째 날짜보다 늦을 수 없습니다.");
				$(this).val("");
				$(this).focus();
				return;
			}
			searchDate.val(date1.val()+date2.val());
		}
	});
	
	$("form").on("submit",function(){
		if(!searchDate.val()){
			alert("등록일 검색 옵션을 선택하세요.");
			return false;
		}
	});
	
});


