<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
  	$().ready(function(){
  	
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
  						
  	//갯수 선택 버튼
  	$("#paging_quantity").children("option").each(function(){
													  				if(${paging_quantity}==$(this).val()){
													  					$(this).prop("selected",true);
													  				}		
  																  })
  									 .end().on("change",function(){
  										 	  	 var url = "/null/ProductListingServlet?cur_page=${cur_page}"+
  										 	  			 		"&paging_quantity="+event.target.value+
  										 	  			 		"&searchedWord=${searchedWord}";
  										 	  	 location.href=url;
  									 })			
  							 
  	// 페이징 버튼
  $("#paging .page.active").on("click",function(){
  											var cur_page = $(this).text();
			  								var paging_quantity = $("#paging_quantity").val();
			  								location.href = "/null/ProductListingServlet?cur_page="+cur_page+
			  													    "&paging_quantity="+paging_quantity+
			  													    "&searchedWord=${searchedWord}";	
			  							});
 	
  	//자동 스크롤 함수
  	var distance =0;
  	var temp =null;
  		$(".body").each(function(){
  			temp = $(this).css("height");
  			distance += Number.parseInt(temp.substr(0,temp.length-2));
  			console.log(this,distance);
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
	

 });//end ready
</script>