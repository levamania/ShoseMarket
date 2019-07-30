/**
 * modifybtns: 수정버튼 클래스 
 */
$(document).ready(function(){
	var delivno=0;
	$(".modifybtns").each(function(idx,btn){
		$(this).on("click",function(){
			delivno=$(this).prev().val();
			$(location).attr("href","../../ModifyAddrList?delivno="+delivno);
		});
	});
});