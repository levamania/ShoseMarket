/**
 * 
 */

$(document).ready(function(){
	var evalcontent= $("#evalcontent");
	var orderscore = $("#start_score");
	$("form").on("submit",function(){
		if(orderscore.val()==0){
			alert("별점을 입력해주세요.");
			return false;
		}
		if(evalcontent.val().length<10){
			alert("최소 10글자가 입력되어야 합니다.");
			return false;
		}
	});
	
});

$(document).ready(function() {
	var orderscore = $("#orderscore");
	var fastdelivery = $("#fastdelivery");
	var ordersatis = $("#ordersatis");
	var evalcontent = $("#evalcontent");
	
	$("input[name=ordersatis]").each(function(idx,radio){
		if($(this).val()==ordersatis.val()){
			$(this).prop("checked",true);
		}
	});
	$("input[name=fastdelivery]").each(function(idx,radio){
		if($(this).val()==fastdelivery.val()){
			$(this).prop("checked",true);
		}
	});
	
	$("textarea").val(evalcontent.val());
	
});
var starRating = function(){
	var $star = $(".star-input"),
	    $result = $star.find("output>b");
	var start_score = $("#start_score");
		
	  	$(document)
		.on("focusin", ".star-input>.input", 
			function(){
	   		 $(this).addClass("focus");
	 	})
			 
	   	.on("focusout", ".star-input>.input", function(){
	    	var $this = $(this);
	    	setTimeout(function(){
	      		if($this.find(":focus").length === 0){
	       			$this.removeClass("focus");
	     	 	}
	   		}, 100);
	 	 })
	  
	    .on("change", ".star-input :radio", function(){
	    	$result.text($(this).next().text());
	    	start_score.val($(this).next().text());
	    	console.log(start_score.val());
	  	})
	    .on("mouseover", ".star-input label", function(){
	    	$result.text($(this).text());
	    	start_score.val($(this).text());
	    	console.log(start_score.val());
	    })
	    .on("mouseleave", ".star-input>.input", function(){
	    	var $checked = $star.find(":checked");
	    		if($checked.length === 0){
	     	 		$result.text("0");
	     	 		start_score.val("0");
	   		 	} else {
	     	 		$result.text($checked.next().text());
	     	 		start_score.val($checked.next().text());
	     	 		console.log(start_score.val());
	    		}
	  	});
	};

	starRating();