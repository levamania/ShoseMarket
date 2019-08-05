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
	  function form_generator(destination,scope){
  		 var html = ""; var data;
  		 //form 태그 생성
   		  if(scope==undefined)scope = $(".searched_product");
	  	  scope.wrap("<form name='product_form' action=' ' method='get' onsubmit='return false'>"+
	  					    "</form>");
  		 
	  	  switch(destination){
	  	  	 case "ProductListingServlet2":{ 
	  	  		 data ={
			  	  	 "searchedWord" : "${searchedWord}",
			    	 "cur_page" : $("#paging>.page.active").text(),
					 "ordering_info" : $("#order_info>.order.active").children().text()
			     };break;
	  	  	 }  	  	 
			 default: data = {
// 					 		"min_price": ${pPrice}
			 }			  ;
	  	  }
	  	  
  		  $.each(data,function(key, value){
				html += "<input type='hidden' name='"+key+"' value='"+value+"' >";
		  });  	
	 	  //form 설정
		  scope.append(html);
	 	  
	 	  var product_form = document.product_form;
	 	  product_form.action = "/null/"+destination;
 	 	  product_form.submit();
	
  	}
  							  			
  	//정렬 옵션 셋팅
  	$("#order_info").children("span").each(function(){
  										  if("${ordering_info}"==$(this).children().text()){
  											  $(this).toggleClass("active");
  										  }else{
  											  $(this).on("click",function(){
  												$(this).toggleClass("active");  
  												$(this).siblings(".active").toggleClass("active");  
  												form_generator("ProductListingServlet2");
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

  	//개별 상품 셋팅
  		//상세 페이지 이동
  	$(".product>div.item.name").on("click",function(){	form_generator("ProductServlet",$(this).parent());});
  	
  	
	//재고 있는 사이즈 정보
	$("div.size_info").on("mouseenter",function(){
								var pCode = $(this).children().text();
								var curr_ele = $(this); 
								
								$.ajax({
									type: "post", 
									url: "/null/ProductServlet",
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