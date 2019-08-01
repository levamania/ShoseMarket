/**
 * 
 */

$(document).ready(function() {
	var phone1_selected = $("#phone1_selected");
	var options = $("#phone1_selected option");
	var email2 = $("#email2");
	
	options.each(function(idx,select){
		if($(select).prop("selected")){
			$(select).removeAttr("selected");
		}
	});
	options.each(function(idx,select){
		if($(select).val()==phone1_selected.val()){
			$(select).attr("selected","selected");
		}
	});
	
	$("#email3").on("change",function(){
		if($(this).val()!=1){
			email2.val($(this).val());
		}
	});
});