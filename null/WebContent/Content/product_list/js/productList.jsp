<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
  	$().ready(function(){

  	 	
  	  	//자동 스크롤 함수
  	  	var distance =0;
  	  	var temp =null;
  	  		$(".body").each(function(){
  	  			temp = $(this).css("height");
  	  			distance += Number.parseInt(temp.substr(0,temp.length-2));
  	  		});	
  	  	distance -= Number.parseInt($(".bottom").css("height").substr(0,temp.length-2)); 	
  	  	distance -= Number.parseInt($(".searched_product").css("height").substr(0,temp.length-2)); 	
  	  	
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

  		
  	 //검색 셋팅 저자용 히든 인풋 태그 생성
	  function form_generator(destination){
  		  //form 태그 생성
  		  $("searched_product").prepend("<form name='product_form' action=' '>")
  		  					   .append("</form>");
  		  //input 설정	 
	  	  var searched_word = "${searchedWord}";
		  var cur_page = $("#paging .page.active").val();
		  var order_criteria = $("#order_info>.order.active").children().text();
	 	  $("searched_product").append(
	 			  			      "<input type='hidden' name='searchedWord' value='"+searched_word+"' >" +
	 			  			      "<input type='hideen' name='cur_page' value='"+cur_page+"' >" +
	 			  			      "<input type='hideen' name='order_criteria' value='"+order_criteria+"' >"
	 	  					   );
	 	  //form 설정
	 	  var product_form = document.product_form;
	 	  product_form.action = "/null/"+destination;
	 	  product_form.submit();
  	}
  							  			
  	//정렬 옵션 셋팅
  	$("#order_info").childern("span").each(function(){
  										  if("${order_criteria}"==$(this).children().text()){
  											  $(this).toggleClass("active");
  										  }else{
  											  $(this).on("click",function(){
  												$(this).toggleClass("active");  
  												$(this).siblings(".active").toggleClass("active");  
  												form_generator(destination);
  											  });
  										  }
  								   	  })
  	 
  	//노출할 상품 갯수 선택 버튼
  	$("#paging_quantity").children("option").each(function(){
												if(${paging_quantity}==$(this).val()){
													$(this).prop("selected",true);
												}		
  											 })
		  									 .end().on("change",function(){
		  										form_generator("ProductListingServlet");
		  									 });			
  							 
  	// 페이징 버튼
    $("#paging .page").on("click",function(){
    							  if(!$(this).hasClass("active")){
	  				  				  $(this).toggleClass("active");
	  								  $(this).siblings(".active").toggleClass("active");
	  								  form_generator("ProductListingServlet");
	    						  }
  							  });

	//재고 있는 사이즈 정보
	$("div.size_info").on("mouseenter",function(){
								var pCode = $(this).children().text();
								var curr_ele = $(this); 
								
								$.ajax({
									type: "post", 
									url: "/null/StockInfoGetterServlet",
									data: {
										pCode: pCode,
										source: "item_size"
									},
									dataType: "json" ,
									success: function(data, status, xhr){
										var arr = data;
										var html = "<div style='position:absolute;left:-10%;top:100%;width:120%;height:auto;" +
																			"background-color:white;z-index:11;" +
																			"padding: 3px 0;border: 1px solid black;" +
																			"color:black; font-size:12px;'>\n";
														  for(var atom of arr){
															  var size = atom.split(":")[0]; //상품 사이즈
															  var yn ="O" ;  //상품 재고 여부
															  var nbsp = "";	//사이즈 재고간의 간격
															  
															  if(Number.parseInt(atom.split(":")[1])==0)yn="X";
															  for(var i=0;i<8;i++)nbsp+="&nbsp;";								  
															  html += size+nbsp+yn+"<br>" 
														   }		
											  html += "\n</div>";
										curr_ele.append(html);
									},
									 error: function(status, xhr, error){
										 console.log(error);
									 }				
								});//end ajax
								
							 })//end on
							 .on("mouseleave",function(){
								$(this).children("div").remove();
							 })
	 	 
 });//end ready
</script>