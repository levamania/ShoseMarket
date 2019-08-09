/**
 * 
 */

$(document).ready(function(){
	var styletop = null;
	var stylemid = null;
	var stylebot = null;
	var ajaxfunc = function(reqFunc,){
		$.ajax({
			type: "get",
			url: "/null/GetSelectorOptionServlet",
			data:{pname:pname.val(),pcode:pcode.val()},
			dataType: "text",
			success: function(data,status,xhr){
				
			},
			error: function(xhr,status,e){
				console.log("error: ",e);
				console.log("status: ",status);
			}
			
		});
	};
	
});