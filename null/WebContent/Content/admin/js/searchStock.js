/**
 * 
 */

function initSelector(selector,options){
	for(var optionObj of options){
		var optionName = optionObj.option;
		var option = $("<option>"+optionName+"</option>");
		selector.append(option);
	}
}

$(document).ready(function(){
	var styletop = $("#styletop");
	var stylemid = $("#stylemid");
	var stylebot = $("#stylebot");
	var keywords = [];
	styletop.empty();
	stylemid.empty();
	stylebot.empty();
	
	$.ajax({
		type: "get",
		url: "/null/GetInitSearchStockServlet",
		dataType: "json",
		success: function(data,status,xhr){
			var styletops = data.styletop;
			var stylemids = data.stylemid;
			var stylebots = data.stylebot;
			for(var value of data.keywords){
				keywords.push(value.keyword);
			}
			$(function(){
				$("#pname").autocomplete({
					source:keywords
				});
			});
			
			
			initSelector(styletop, styletops);
			initSelector(stylemid, stylemids);
			initSelector(stylebot, stylebots);
		},
		error: function(xhr,status,e){
			console.log("error: ",e);
			console.log("status: ",status);
		}
	});
	
	
});


function dateValueRemoveCss(){
	$(".dateValue").each(function(idx,button){
		$(this).css("background-color","");
	});
}
$(document).ready(function() {
	var searchDate = $("#searchDate");
	var date1 = $("#date1");
	var date2 = $("#date2");
	searchDate.val("");
	$(".dateValue").each(function(idx,button) {
		$(this).on("click",function(){
			dateValueRemoveCss();
			$(this).css("background-color","red");
			var date= $(this).text();
			searchDate.val(date);
		});
	});
	
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

