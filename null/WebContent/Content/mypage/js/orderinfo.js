/**
 * 
 */

//dateValue button css 속성 부여 
$(document).ready(function() {
	var searchDate = $('#searchDate');
	var date1 =$('#date1');
	var date2 =$('#date2');
	var createDate = function(day){
		var d = new Date();
		var oneMonth = 30*24*60*60*1000;
		var twoWeek = 15*24*60*60*1000;
		var threeMonth = 3*oneMonth;
		if (day =='15일'){
			d = new Date(d.getTime()-twoWeek);
		}else if (day == '1개월'){
			d = new Date(d.getTime()-oneMonth);
		}else if (day ==  '3개월'){
			d = new Date(d.getTime()-threeMonth);
		}
		var str = ""+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		return str;
	};
	
	var dateBtns = $('button').filter('.dateValue');
	dateBtns.each(function(idx,button){
		$(button).on("click",function(){
			dateBtns.each(function(idx,button) {
				if($(button).prop("style")){
					$(this).removeAttr("style");
				}
			});
			date1.val("");
			date2.val("");
			console.log(createDate($(this).text()));
			$(this).css("background-color","red");
			searchDate.val(createDate($(this).text()));
		});
	});
	$(".datepicker").each(function(idx,item){
		$(item).on("change",function(){
			dateBtns.each(function(idx,button) {
				if($(button).prop("style")){
					$(this).removeAttr("style");
					if(searchDate.val().length>0){
						searchDate.val("");
					}
				}
			});
			var str = ""+searchDate.val();
			str+=$(this).val();
			searchDate.val(str);
		});
	});
	
	
	$("#searchBtn").on("click",function(){
		if(searchDate.val()){
			$(location).attr("href","/null/OrderInfoServlet?day="+searchDate.val());
		}else if(date1.val().length+date2.val().length>0){
			if(date1.val().length==0||date2.val().length==0){
				alert("범위 날짜 입력이 잘못 되었습니다.")
			}else if(date1.val()>=date2.val()){
				alert("두번째 범위 날짜는 첫번재 범위 날짜보다 낮을 수 없습니다..")
			}else{
				$(location).attr("href","/null/OrderInfoServlet?day="+date1.val()+date2.val());
			}
		}else{
			alert("날짜 입력!!!");
		}
	});
});

// 선택된 날짜 전송 
$(document).ready(function() {
	var dateBtns = $('button').filter('.dateValue');

});
