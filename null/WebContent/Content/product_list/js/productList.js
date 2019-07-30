
//list whole-body


//searched_product
	$().ready(function(){
	
	$("div.size_info").on("mouseenter",function(){
								var pCode = $(this).children().text();
								var curr_ele = $(this); 
								
								$.ajax({
									type: "post", 
									url: "/null/SizeGetterServlet",
									data: {pCode: pCode},
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
		
	});